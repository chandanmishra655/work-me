from django.contrib.auth import logout, authenticate, login
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render

# Create your views here.
from user.forms import LoginForm
from user.models import CustomUser


def admin_login(request):
    not_match = 'ok'
    if request.user.is_authenticated:
        return HttpResponseRedirect('/accounts/dashboard/')

    if request.method == 'POST':
        form2 = LoginForm(request.POST)
        if form2.is_valid():
            username = form2.cleaned_data['username']
            password = form2.cleaned_data['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active and user.user_type == 1:
                    request.session['username'] = username
                    request.session['id'] = user.id
                    request.session['email'] = user.email
                    request.session['user_type'] = user.user_type
                    login(request, user)
                    next = request.GET.get('next')
                    if next:
                        return HttpResponseRedirect(next)
                    else:
                        return HttpResponseRedirect('/accounts/dashboard/')
                else:
                    not_match = 'You must be login as admin'
                    form2 = LoginForm()
                    return render(request, 'admin_login.html', {'form2': form2, 'not_match': not_match})
            else:
                not_match = 'Either username or password is wrong'
                form2 = LoginForm()
                return render(request, 'admin_login.html', {'form2': form2, 'not_match': not_match})
    else:
        form2 = LoginForm()
    return render(request, 'admin_login.html', {'form2': form2, 'not_match': not_match})


# @login_required
def logout_user(request):
    """logout function it will delete session also"""
    logout(request)
    return HttpResponseRedirect('/accounts/admin/')


@login_required
def dashboard(request):
    total_members = CustomUser.objects.filter(user_type__in=[2, 3, 4]).count()

    return render(request, 'admin_dashboard.html', {'total_members': total_members})