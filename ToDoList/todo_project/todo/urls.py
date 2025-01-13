from django.urls import path ,include
from . import views

urlpatterns = [
    path('', views.home, name='home'),  # Home page
    path('create/', views.create_todo, name='create_todo'),  # Page to create new tasks
    path('view/', views.view_task, name='view_task'),  # Page to view tasks
    path('complete/<int:todo_id>/', views.complete_todo, name='complete_todo'),  # Mark task as complete
    path('delete/<int:todo_id>/', views.delete_todo, name='delete_todo'),  # Delete task
    path('update/<int:todo_id>/', views.update_todo, name='update_todo'),  # Update task
]
