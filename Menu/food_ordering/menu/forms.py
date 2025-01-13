# forms.py
from django import forms
from .models import Order, OrderItem

# Form for the Order model
class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ['customer_name','items']

# Form for the OrderItem model
class OrderItemForm(forms.ModelForm):
    class Meta:
        model = OrderItem
        fields = ['quantity']

