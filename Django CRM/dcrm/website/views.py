from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login,  logout
from django.contrib import messages
from .forms import SignUpForm, AddRecordForm
from django.contrib.auth.forms import PasswordResetForm
from django.contrib.auth.models import User
from .models import Record

def home(request):
    query = request.GET.get('search', '')  # Get the search input from the query string

    # Filter records based on search input or return all records
    if query:
        records = Record.objects.filter(
            first_name__icontains=query
        ) | Record.objects.filter(
            last_name__icontains=query
        ) | Record.objects.filter(
            email__icontains=query
        )  # Search by multiple fields
    else:
        records = Record.objects.all()  # Show all records if no query is provided

    # Handle login logic
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        # Authenticate user
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, 'You Have Been Logged In!')
            return redirect('home')
        else:
            messages.error(request, 'There Was An Error Logging In, Please Try Again...')
            return redirect('home')

    # Pass records and query to the template
    context = {'records': records, 'query': query}
    return render(request, 'home.html', context)


def login_user(request):
    pass

def logout_user(request):
    logout(request)
    messages.success(request, ('You Have Been Logged Out...'))
    return redirect('home')

def register_user(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            # Authenticate and login
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            login(request, user)
            messages.success(request, ('You Have Successfully Registered...'))
            return redirect('home')
    else:
        form = SignUpForm()
        return render(request, 'register.html', {'form':form})

    return render(request, 'register.html', {'form':form})

def reset_password(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')

        # Validate username
        user = User.objects.filter(username=username).first()
        if not user:
            messages.error(request, 'Username does not exist.')
            return render(request, 'reset_password.html')

        # Validate password match
        if new_password != confirm_password:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'reset_password.html')

        # Update password
        user.set_password(new_password)
        user.save()
        messages.success(request, 'Password has been successfully reset. You can now log in.')
        return redirect('home')

    return render(request, 'reset_password.html')


def customer_record(request, pk):
    if request.user.is_authenticated:
        # Look Up Records
        customer_record = Record.objects.get(id=pk)
        return render(request, 'record.html', {'customer_record':customer_record})
    else:
        messages.success(request, ('You Must Be Logged In To View That Page...'))
        return redirect('home')
    
def delete_record(request, pk):
    if request.user.is_authenticated:
        delete_it = Record.objects.get(id=pk)
        delete_it.delete()
        messages.success(request, ('Record Deleted Successfully...'))
        return redirect('home')
    else:
        messages.success(request, ('You Must Be Logged In To Do That...'))
        return redirect('home')
    
def add_record(request):
    form = AddRecordForm(request.POST or None)
    if request.user.is_authenticated:
        if request.method == "POST":
            if form.is_valid():
                form.save()
                messages.success(request, "Record Added...")
                return redirect('home')
        return render(request, 'add_record.html', {'form':form})
    
    else:
        messages.success(request, ("You Must Be Logged In..."))
        return redirect('home')

def update_record(request, pk):
    if request.user.is_authenticated:
        current_record = Record.objects.get(id=pk)
        form = AddRecordForm(request.POST or None, instance=current_record)
        if form.is_valid():
            form.save()
            messages.success(request, "Record Has Been Updated!")
            return redirect('home')
        return render(request, 'update_record.html', {'form':form})
    else:
        messages.success(request, "You Must Be Logged In...")
        return redirect('home')
    