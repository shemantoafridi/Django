from django.db import models

class MenuItem(models.Model):
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=6, decimal_places=0)
    unit = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Order(models.Model):
    customer_name = models.CharField(max_length=100)
    items = models.ManyToManyField(MenuItem, through='OrderItem')
    status = models.CharField(max_length=10, choices=[('Paid', 'Paid'), ('Unpaid', 'Unpaid')], default='Unpaid')
    

    def __str__(self):
        return self.customer_name

class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    menu_item = models.ForeignKey(MenuItem, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.order.customer_name} - {self.menu_item.name} ({self.quantity})"
    
