from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, Cart, CartItem, Order
##from django.contrib.auth.decorators import login_required
from .forms import ProductForm
from django.http import HttpResponse

from django.shortcuts import render, redirect, get_object_or_404
from .models import Product, Category, Cart, CartItem, Order
from .forms import ProductForm, CategoryForm
from django.contrib.auth.decorators import login_required

def home(request):
    return render(request, 'store/home.html')

def product_list(request):
    products = Product.objects.all()  # Fetch all products
    return render(request, 'store/product_list.html', {'products': products})

@login_required
def add_product(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()  # Save the new product
            return redirect('product_list')  # Redirect to the product list
    else:
        form = ProductForm()
    return render(request, 'store/add_product.html', {'form': form})

@login_required
def add_category(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()  # Save the new category
            return redirect('category_list')  # Redirect to the category list
    else:
        form = CategoryForm()
    return render(request, 'store/add_category.html', {'form': form})

def category_list(request):
    categories = Category.objects.all()  # Fetch all categories
    return render(request, 'store/category_list.html', {'categories': categories})

def product_detail(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    return render(request, 'store/product_detail.html', {'product': product})

def add_to_cart(request, product_id):
    # Check if the user has a cart in the session
    cart_id = request.session.get('cart')
    
    # Create a new cart if none exists
    if not cart_id:
        cart = Cart.objects.create()
        request.session['cart'] = cart.id
    else:
        cart = get_object_or_404(Cart, id=cart_id)

    product = get_object_or_404(Product, id=product_id)
    
    # Get or create the CartItem
    cart_item, created = CartItem.objects.get_or_create(cart=cart, product=product)
    if not created:
        cart_item.quantity += 1  # Increment quantity if item already in cart
    cart_item.save()

    return redirect('cart_detail')

def cart_detail(request):
    cart_id = request.session.get('cart')
    cart = get_object_or_404(Cart, id=cart_id) if cart_id else None
    return render(request, 'store/cart_detail.html', {'cart': cart})

##@login_required
def checkout(request):
    cart_id = request.session.get('cart')
    
    # Check if cart exists
    if not cart_id:
        return redirect('product_list')  # Redirect if no cart found

    cart = get_object_or_404(Cart, id=cart_id)

    if request.method == 'POST':
        # Create an order with the provided data
        order = Order.objects.create(
            cart=cart,
            name=request.POST['name'],
            email=request.POST['email'],
            address=request.POST['address']
        )
        del request.session['cart']  # Clear the cart from session
        return redirect('order_success')

    return render(request, 'store/checkout.html', {'cart': cart})

def order_success(request):
    return render(request, 'store/order_success.html')
