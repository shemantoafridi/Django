from django.shortcuts import render, get_object_or_404, redirect
from .models import Product

def home(request):
    products = Product.objects.all()  # Fetch all products from the database
    return render(request, 'home.html', {'products': products})

def product(request, product_id):
    product = get_object_or_404(Product, id=product_id)  # Fetch product by ID
    return render(request, 'product_detail.html', {'product': product})

def add_to_cart(request, product_id):
    # Get the product from the database
    product = Product.objects.get(id=product_id)
    
    # Get the cart from the session, or initialize an empty cart if it doesn't exist
    cart = request.session.get('cart', [])
    
    # Add the product to the cart (if not already in the cart)
    if product_id not in cart:
        cart.append(product_id)
        request.session['cart'] = cart
    
    # Redirect back to the referring page
    return redirect(request.META.get('HTTP_REFERER', '/'))
    
def cart(request):
    # Get the list of product IDs from the session
    cart = request.session.get('cart', [])
    
    # Get the actual products from the database
    products_in_cart = Product.objects.filter(id__in=cart)
    
    return render(request, 'cart.html', {'products': products_in_cart})
def remove_from_cart(request, product_id):
    # Get the current cart from the session
    cart = request.session.get('cart', [])
    
    # If the product is in the cart, remove it
    if product_id in cart:
        cart.remove(product_id)
        request.session['cart'] = cart
    
    # Redirect back to the cart page
    return redirect('cart')