from django import template
from seafood.models import Product

register = template.Library()

@register.filter
def get_item(value, product_id):
    return Product.objects.get(id=product_id)
