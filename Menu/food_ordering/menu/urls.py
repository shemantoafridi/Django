from django.urls import path
from . import views

urlpatterns = [
    path('', views.menu_view, name='menu'),
    path('order/', views.order_view, name='order'),
    path('bill/', views.bill_view, name='bill'),
    path('payment/<int:order_id>/', views.payment, name='payment'),
    path('orders/', views.manage_orders, name='manage_orders'),  # View and manage orders
    path('orders/edit/<int:order_id>/', views.edit_order, name='edit_order'),  # Edit order
    path('orders/delete/<int:order_id>/', views.delete_order, name='delete_order'),  # Delete order
    path('manage-orders/', views.manage_orders, name='manage_orders'),  # URL for viewing orders
]