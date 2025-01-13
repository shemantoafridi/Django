from django.shortcuts import render, redirect, get_object_or_404
from .models import MenuItem, Order, OrderItem
from datetime import datetime
from .forms import OrderForm

def menu_view(request):
    menu_items = MenuItem.objects.all()
    print(menu_items)  # Print to console to debug
    return render(request, 'menu/menu.html', {'menu_items': menu_items})

def order_view(request):
    menu_items = MenuItem.objects.all()

    if request.method == "POST":
        customer_name = request.POST.get('customer_name')
        if customer_name:
            order = Order.objects.create(customer_name=customer_name)

            # Loop through submitted items
            for key, quantity in request.POST.items():
                if key.startswith('item_') and quantity.isdigit():
                    menu_item_id = int(key.split('_')[1])
                    menu_item = MenuItem.objects.get(id=menu_item_id)
                    OrderItem.objects.create(order=order, menu_item=menu_item, quantity=int(quantity))

            return redirect('order')  # Redirect after successful submission

    return render(request, 'menu/order.html', {'menu_items': menu_items})

def bill_view(request):

    orders = Order.objects.all()
    bill_data = []
    
    for order in orders:
        
        total_amount = 0
        total_items = []
       
        for item in order.orderitem_set.all():
            amount = item.menu_item.price * item.quantity
            total_amount += amount
            total_items.append({
                "name": item.menu_item.name,
                "quantity": item.quantity,
                "unit": item.menu_item.unit,
                "price": item.menu_item.price,
                "amount": amount
        
            })

        bill_data.append({
            "id": order.id,
            "customer_name": order.customer_name,
            "total_amount": total_amount,
            "items": total_items,
            "status": order.status,  # Include payment status
        })

    

    return render(request, 'menu/bill.html', {'bill_data': bill_data})

def payment(request, order_id):
    order = get_object_or_404(Order, id=order_id)

    if request.method == "POST":
        status = request.POST.get("status")
        if status in ["Paid", "Unpaid"]:
            order.status = status
            order.save()
    
    return redirect('bill')
def manage_orders(request):
    orders = Order.objects.all()  # Fetch all orders
    return render(request, 'menu/manage_orders.html', {'orders': orders})

def edit_order(request, order_id):
    order = get_object_or_404(Order, id=order_id)

    if request.method == 'POST':
        # Update customer name
        customer_name = request.POST.get('customer_name')
        if customer_name:
            order.customer_name = customer_name
            order.save()

        # Update food quantities
        for item in order.orderitem_set.all():
            quantity = request.POST.get(f'quantity_{item.id}')
            if quantity and quantity.isdigit():
                item.quantity = int(quantity)
                item.save()

        return redirect('manage_orders')  # Redirect back to order management after saving

    return render(request, 'menu/edit.html', {'order': order})



def delete_order(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    if request.method == 'POST':
        order.delete()
        return redirect('manage_orders')  # Redirect back to order management
    return render(request, 'menu/delete.html', {'order': order})

# def clock(request):
    # Get the current time
    now = datetime.now()

    # Calculate the angles for each hand
    hour_angle = (now.hour % 12) * 30 + (now.minute / 2)  # Each hour represents 30 degrees, and we add a bit for the minutes.
    minute_angle = now.minute * 6  # Each minute represents 6 degrees.
    second_angle = now.second * 6  # Each second represents 6 degrees.

    return render(request, 'base.html', {
        'hour_angle': hour_angle,
        'minute_angle': minute_angle,
        'second_angle': second_angle
    })