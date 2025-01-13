from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name='home'),
    path('product', views.product_list, name='product_list'),  # Home page showing the product list
    path('add-product/', views.add_product, name='add_product'),
    path('product/<int:product_id>/', views.product_detail, name='product_detail'),  # Product detail page
    path('add-to-cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),  # Add product to cart
    path('cart/', views.cart_detail, name='cart_detail'),  # Shopping cart details
    path('checkout/', views.checkout, name='checkout'),  # Checkout page
    path('order-success/', views.order_success, name='order_success'),  # Order success page
]

# Serve media files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
