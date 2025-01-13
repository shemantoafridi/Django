from django.shortcuts import render, redirect
from .models import Todo

# Home page with links to create or view tasks
def home(request):
    return render(request, 'todo/home.html')

# Create new task
def create_todo(request):
    if request.method == 'POST':
        title = request.POST['title']
        description = request.POST['description']
        Todo.objects.create(title=title, description=description)
        return redirect('view_task')
    return render(request, 'todo/create_todo.html')

# View and manage tasks (complete, update, delete)
def view_task(request):
    todos = Todo.objects.all()

    # Check if 'edit' query parameter is provided for editing
    edit_todo_id = request.GET.get('edit')
    if edit_todo_id:
        for todo in todos:
            if str(todo.id) == edit_todo_id:
                todo.is_editing = True

    return render(request, 'todo/view_task.html', {'todos': todos})

# Complete task
def complete_todo(request, todo_id):
    todo = Todo.objects.get(id=todo_id)
    todo.completed = True
    todo.save()
    return redirect('view_task')

# Delete task
def delete_todo(request, todo_id):
    todo = Todo.objects.get(id=todo_id)
    todo.delete()
    return redirect('view_task')

# Update task
def update_todo(request, todo_id):
    todo = Todo.objects.get(id=todo_id)
    if request.method == 'POST':
        todo.title = request.POST['title']
        todo.description = request.POST['description']
        todo.save()
    return redirect('view_task')
