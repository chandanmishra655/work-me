from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.tokens import default_token_generator
from django.core.mail import send_mail
from django.db.models import Q
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.template import loader
from django.template.loader import render_to_string
from django.views.generic import FormView
from aaqf.settings import DEFAULT_FROM_EMAIL
from accounts.models import UserInfo, UserInfoMapping
from payment.models import Payment
from user.middleware import AuthRequiredMiddleware
from .forms import LoginForm, PasswordResetRequestForm, SetPasswordForm
from datetime import datetime
from .models import *

from django.core.mail import send_mail
from aaqf import settings


# Create your views here.


@AuthRequiredMiddleware
def redirect_to_login(request):
    """this will redirect on user login page"""
    if request.user.is_authenticated:
        return HttpResponseRedirect('/user/dashboard/')
    else:
        return HttpResponseRedirect('/user/login/')


def login_user(request):
    # id = User_Company_Mapping.objects.filter(Q(user_id=10) & Q(current_company=2)).values('order_by')
    not_match = 'ok'
    if request.user.is_authenticated:
        return HttpResponseRedirect('/user/dashboard/')

    if request.method == 'POST':
        form2 = LoginForm(request.POST)
        # print('coming here---')
        # print(form2.is_valid())
        is_taken = True
        if form2.is_valid():
            username = form2.cleaned_data['username']
            password = form2.cleaned_data['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.user_type == 1 or user.user_type == 5:
                    not_match = 'Either username or password is wrong'
                    is_taken = False
                    form2 = LoginForm()
                    return render(request, 'login1.html',
                                  {'form2': form2, id: id, 'not_match': not_match, 'is_taken': is_taken})
                else:
                    print(request.session,'++++++++ this is session +++++++++++')
                    if user.is_active:
                        request.session['username'] = username
                        request.session['id'] = user.id
                        request.session['user_type'] = user.user_type
                        request.session['is_subscribe'] = user.is_subscribe
                        if user.membership:
                            request.session['membership'] = 1
                        else:
                            request.session['membership'] = 0
                        request.session['email'] = user.email
                        login(request, user)
                        next = request.GET.get('next')
                        if next:
                            return HttpResponseRedirect(next)
                        else:
                            return HttpResponseRedirect('/user/dashboard/')
            else:
                # not_match.append("not_match")
                not_match = 'Either username or password is wrong'
                is_taken = False
                form2 = LoginForm()
                return render(request, 'login1.html',
                              {'form2': form2, 'not_match': not_match, 'is_taken': is_taken})
    else:
        form2 = LoginForm()
    return render(request, 'login1.html', {'form2': form2, id: id, 'not_match': not_match})


# @login_required
def logout_user(request):
    """logout function it will delete session also"""
    logout(request)
    return HttpResponseRedirect('/user/login/')


def register(request):
    mid = request.GET.get('mid')
    prefix = OmPrefix.objects.all().order_by('op_name')
    country = Country.objects.all().order_by('name')
    if request.method == 'POST':
        form = request.POST
        prefix = form.get('prefix')
        first_name = form.get('first_name')
        middle_name = form.get('middle_name')
        last_name = form.get('last_name')
        suffix = form.get('suffix')
        organization = form.get('organization')
        title = form.get('title')
        mailingaddress = form.get('mailingaddress')
        address_line2 = form.get('address_line2')
        city = form.get('city')
        adr_country = form.get('adr_country')
        adr_state = form.get('adr_state')
        adr_post_code = form.get('adr_post_code')
        adr_intl_province = form.get('adr_intl_province')
        eml_address = form.get('eml_address')
        phone_number = form.get('phone_number')
        new_password = form.get('new_password')
        membership_id = form.get('membership_id')

        result = {}
        user_obj = CustomUser.objects.filter(email=eml_address)
        if user_obj.exists():
            result['status'] = 'error'
            result['msg'] = 'Email already registered'
            result['mid'] = mid
            return JsonResponse(result)
        
        print("here am i ")

        dict_new = {
            "username":eml_address, 
            "email":eml_address, 
            "user_op_id":prefix,
            "first_name":first_name, 
            "last_name":last_name, 
            "middle_name":middle_name,
            "organization":organization, 
            "title":title,
            "address1":mailingaddress, 
            "address2":address_line2, 
            "city":city,
            "user_oc_id":adr_country, 
            "zip_code":adr_post_code,
            "membership_id":1,
            "phone_number":phone_number,
            "password":new_password
        }

        print(dict_new,'+++++++++')

        membership_new_id = OmMembershipPlan.objects.last()
        print(membership_new_id.omp_id,'+++++++++++ this is id ++++++++++++')

        try:
            qs = CustomUser.objects.create_user(username=eml_address, email=eml_address, user_op_id=prefix,
                                                first_name=first_name, last_name=last_name, middle_name=middle_name,
                                                organization=organization, title=title,
                                                address1=mailingaddress, address2=address_line2, city=city,
                                                user_oc_id=adr_country, zip_code=adr_post_code,
                                                membership_id=membership_new_id.omp_id,
                                                phone_number=phone_number,
                                                password=new_password)
            if qs:
                if adr_state:
                    qs.user_ost_id = adr_state
                    qs.save()
                    print("created")
                try:    
                    send_email(request, eml_address)
                except Exception as e:
                    print('email not send')
                result['status'] = 'success'
                result['msg'] = 'Registered successfully'
                result['mid'] = str(membership_id)
                result['uid'] = str(qs.pk)
                return JsonResponse(result)
                # return redirect('/payment/checkout_page/?uid=' + str(qs.pk) + '&mid=' + str(membership_id))
            else:
                result['status'] = 'error'
                result['msg'] = 'Could not registered'
                result['mid'] = mid
                return JsonResponse(result)
        except Exception as e:
            print(e, 'Error At Line 109')
            messages.success(request, e)
        return render(request, 'register1.html', {'mid': mid, 'prefix': prefix,
                                                  'country': country})
    else:
        return render(request, 'register1.html', {'mid': mid, 'prefix': prefix,
                                                  'country': country})


def membership(request):
    if request.method == 'POST':
        form = request.POST
        return render(request, 'register1.html')
    else:
        try:
            # qs = OmMembershipPlan.objects.filter(omp_is_display=True, omp_plan_type__in=[1, 2]).order_by('omp_order_by')
            qs = OmMembershipPlan.objects.filter( omp_plan_type__in=[1, 2]).order_by('omp_order_by')
            print(qs, 'qssss')
        except Exception as e:
            print(e, 'errror333333')
        return render(request, 'membership2.html', {'data': qs})


@login_required
def dashboard(request):

    user_id = request.session['_auth_user_id']
    objects = Q(user_id=user_id)
    q = UserInfo.objects.filter(objects)
    lst_count = len(q)
    return render(request, 'dashboard.html', {'lst_count': lst_count})


@login_required
def transaction(request):
    return render(request, 'transaction.html')


@login_required
def checkout(request):
    return render(request, 'checkout.html')


@login_required
def individual(request):
    return render(request, 'individual.html')


@login_required()
def get_individual_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    objects = Q(user_type=2)
    if search:
        search_str = search.split(' ')
        objects = objects & (Q(email__icontains=search_str[0]) |
                             Q(first_name__icontains=search_str[0]) |
                             Q(title__icontains=search_str[0]) |
                             Q(username__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(email__icontains=term) |
                             Q(first_name__icontains=term) |
                             Q(title__icontains=term) |
                             Q(username__icontains=term)), Q.AND)
    not_queryset = Q(is_suspend=0) & Q(is_delete=0)
    lst_stmt = CustomUser.objects.filter(objects, not_queryset).order_by('id')[int(start):(int(last) + int(start))]
    q = CustomUser.objects.filter(objects, not_queryset)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        name = ''
        if i.first_name and i.last_name:
            name = i.first_name + ' ' + i.last_name
        doc_list1.append('<a href="#" class="user-link">' + str(name) + '</a> <span class="user-subhead">Member</span>')
        created_dt = ''
        if i.created_dt:
            created_dt = get_date_format(i.created_dt, '%Y-%m-%d')
        doc_list1.append(created_dt)
        status = 'Pending'
        if i.is_subscribe == 1:
            status = 'Completed'
        doc_list1.append('<span class="label label-default">' + str(status) + '</span>')
        doc_list1.append('<a href="#">' + str(i.email) + '</a>')
        try:
            payment_count = Payment.objects.filter(user_id=i.id).count()
        except:
            payment_count = 0

        doc_list1.append('<a href="#">' + str(payment_count) + ' Transaction</a>')
        doc_list1.append('<a href="#">' + str(payment_count) + ' Transaction</a>')

        doc_list1.append('<span data-attr-value="suspend" onclick="suspend_delete(' + str(
            i.pk) + ', \'' + 'suspend' + '\')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-search-plus '
                                         'fa-stack-1x fa-inverse"></i></span><a href="/user/update_profile/' + str(
            i.pk) + '/"'
                    'class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                    'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a><span data-attr-value="suspend" onclick="suspend_delete(' + str(
            i.pk) + ', \'' + 'delete' + '\')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i '
                                        'class="fa fa-trash-o fa-stack-1x fa-inverse"></i></span>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def organizational(request):
    qs = CustomUser.objects.all()
    return render(request, 'organizational.html', {'data': qs})


@login_required()
def get_organizational_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    objects = Q(user_type=3)
    if search:
        search_str = search.split(' ')
        objects = objects & (Q(email__icontains=search_str[0]) |
                             Q(first_name__icontains=search_str[0]) |
                             Q(title__icontains=search_str[0]) |
                             Q(username__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(email__icontains=term) |
                             Q(first_name__icontains=term) |
                             Q(title__icontains=term) |
                             Q(username__icontains=term)), Q.AND)

    lst_stmt = CustomUser.objects.filter(objects).order_by('id')[int(start):(int(last) + int(start))]
    q = CustomUser.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        name = ''
        if i.first_name and i.last_name:
            name = i.first_name + ' ' + i.last_name
        doc_list1.append('<a href="#" class="user-link">' + str(name) + '</a> <span class="user-subhead">Member</span>')
        created_dt = ''
        if i.created_dt:
            created_dt = get_date_format(i.created_dt, '%Y-%m-%d')
        doc_list1.append(created_dt)
        status = 'Pending'
        if i.is_subscribe == 1:
            status = 'Completed'
        doc_list1.append('<span class="label label-default">' + str(status) + '</span>')
        doc_list1.append('<a href="#">' + str(i.email) + '</a>')
        try:
            payment_count = Payment.objects.filter(user_id=i.id).count()
        except:
            payment_count = 0

        doc_list1.append('<a href="#">' + str(payment_count) + ' Transaction</a>')
        doc_list1.append('<a href="#">' + str(payment_count) + ' Transaction</a>')
        doc_list1.append('<a href="#" class="table-link text-warning"><span '
                         'class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-search-plus '
                         'fa-stack-1x fa-inverse"></i></span></a><a href="/user/update_profile/' + str(i.pk) + '/" '
                                                                                                               'class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                                                                                                               'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a><a href="#" '
                                                                                                               'class="table-link danger"><span class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i '
                                                                                                               'class="fa fa-trash-o fa-stack-1x fa-inverse"></i></span></a>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def accredited(request):
    user_type = request.session['user_type']
    if user_type == 1:
        base_template = 'admin_base.html'
    else:
        base_template = 'base.html'

    return render(request, 'accredited.html', {'user_type': user_type, 'base_template': base_template})


@login_required()
def get_accredited_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    user_type = request.session['user_type']
    user_id = request.session['id']
    objects = Q()
    if user_type != 1:
        objects = Q(user_id=user_id)

    if search:
        search_str = search.split(' ')
        objects = objects & (Q(email__icontains=search_str[0]) |
                             Q(first_name__icontains=search_str[0]) |
                             Q(title__icontains=search_str[0]) |
                             Q(username__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(email__icontains=term) |
                             Q(first_name__icontains=term) |
                             Q(title__icontains=term) |
                             Q(username__icontains=term)), Q.AND)

    lst_stmt = UserInfo.objects.filter(objects).order_by('id')[int(start):(int(last) + int(start))]
    q = UserInfo.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1
    for i in lst_stmt:
        doc_list1 = [inc]
        name = ''
        if i.facility_ceo_name:
            name = i.facility_ceo_name
        doc_list1.append('<a href="#" class="user-link">' + str(name) + '</a>')
        doc_list1.append(i.facility_ceo_phone)
        doc_list1.append('<a href="#">' + str(i.facility_ceo_email) + '</a>')
        status = 'Draft'
        if i.save_as == '1':
            status = 'Completed'
        doc_list1.append('<span class="label label-default">' + str(status) + '</span>')
        if i.accreditation.omp_code:
            doc_list1.append('<a href="#">' + str(i.accreditation.omp_code) + ' Transaction</a>')
        else:
            doc_list1.append('')

        doc_list1.append('<a href="#" class="table-link text-warning"><span '
                         'class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-search-plus '
                         'fa-stack-1x fa-inverse"></i></span></a><a href="/user/applied_update/' + str(i.pk) + '/" '
                                                                                                               'class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                                                                                                               'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a><a href="#" '
                                                                                                               'class="table-link danger"><span class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i '
                                                                                                               'class="fa fa-trash-o fa-stack-1x fa-inverse"></i></span></a>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def applied_update(request, id):
    return render(request, 'applied_update.html')


@login_required
def update_profile(request, id):
    print(request.session.items())
    user_type = request.session['_auth_user_id']

    if user_type == 1:
        base_template = 'admin_base.html'
    else:
        base_template = 'base.html'
    if request.method == 'POST':
        form = request.POST
        form1 = request.FILES
        prefix = form.get('prefix')
        first_name = form.get('firstname')
        middle_name = form.get('middlename')
        last_name = form.get('lastname')
        # suffix = form.get('suffix')
        organization = form.get('organization')
        title = form.get('title')
        mailing_address = form.get('mailingaddress')
        address_line2 = form.get('address_line2')
        city = form.get('city')
        adr_country = form.get('adr_country')
        adr_state = form.get('adr_state')
        adr_post_code = form.get('adr_post_code')
        # adr_province = form.get('adr_intl_province')
        eml_address = form.get('eml_address')
        profile_image = form1.get('profile')
        try:
            user_obj = CustomUser.objects.get(id=id)
            user_obj.user_op_id = int(prefix)
            user_obj.first_name = first_name
            user_obj.middle_name = middle_name
            user_obj.last_name = last_name
            # user_obj.user_os_id = int(suffix)
            user_obj.organization = organization
            user_obj.title = title
            if profile_image:
                user_obj.image = profile_image
            user_obj.address1 = mailing_address
            user_obj.address2 = address_line2
            user_obj.city = city
            user_obj.user_oc_id = int(adr_country)
            user_obj.user_ost_id = int(adr_state)
            user_obj.zip_code = adr_post_code
            # user_obj.int_province = adr_province
            user_obj.save()
        except:
            pass
        return redirect('/user/update_profile/' + str(id))
    else:
        qs = {}
        try:
            qs = CustomUser.objects.get(pk=id)
        except Exception as e:
            print(e, 'Error At Line 162')
        prefix = OmPrefix.objects.all().order_by('op_name')
        country = Country.objects.all().order_by('name')
        states = State.objects.all().order_by('name')
        return render(request, 'update_profile.html',
                      {'user': qs, 'prefix': prefix, 'country': country,
                       'states': states, 'base_template': base_template})


def change_password_popup(request):
    # from django.contrib.auth import authenticate
    user_id = request.session['id']
    current_date = datetime.now().date()
    if request.method == 'POST':
        form = request.POST
        new_password = form.get('new_password')
        current_password = form.get('current_password')
        user_name = request.session['username']

        user = authenticate(username=user_name, password=current_password)
        if user is not None:
            if user.is_active:
                user.set_password(new_password)
                user.save()
                is_valid = 1
                msg = 'Password changed successfully'
            else:
                is_valid = 0
                msg = 'Something error'
        else:
            is_valid = 0
            msg = 'Current password is not correct.'
        data_json = {
            'msg': msg,
            'userid': user_id,
            'is_valid': is_valid
        }
        return JsonResponse(data_json)


class ResetPasswordRequestView(FormView):
    """ Forgot password function, it will send email link which user has been register
        and user name also and link for reset password link in that mail
    """
    template_name = "forgot1.html"
    success_url = '/user/reset_password/'
    form_class = PasswordResetRequestForm

    # @staticmethod
    # def validate_email_address(email):
    #   try:
    #      validate_email(email)
    #     return True
    # except ValidationError:
    #   return False

    def post(self, request, *args, **kwargs):
        forget_form = self.form_class(request.POST)
        if forget_form.is_valid():
            data = forget_form.cleaned_data["email_or_username"]
            # if self.validate_email_address(data) is True:
            associated_users = CustomUser.objects.filter(Q(username=data))
            if associated_users.exists():
                for user in associated_users:
                    # print(user.email)
                    c = {
                        'email': user.email,
                        'domain': request.META['HTTP_HOST'],
                        'site_name': 'AAQF Portal',
                        'uid': user.pk,
                        'user': user,
                        'token': default_token_generator.make_token(user),
                        'protocol': 'http',
                    }
                    subject_template_name = 'registration/password_reset_subject.txt'
                    email_template_name = 'password_reset_email.html'
                    subject = loader.render_to_string(subject_template_name, c)
                    subject = ''.join(subject.splitlines())
                    email = loader.render_to_string(email_template_name, c)
                    ggg = send_mail(subject, email, DEFAULT_FROM_EMAIL, [user.email], fail_silently=False)
                    result = self.form_valid(forget_form)
                    messages.success(request, 'An email has been sent to ' + data +
                                     ". Please check its inbox to continue resetting password.")
                    return result
                result = self.form_invalid(forget_form)
                messages.error(request, 'This username does not exist in the system.')
                return result
            messages.error(request, 'Email does not exist')
            return self.form_invalid(forget_form)


class PasswordResetConfirmView(FormView):
    template_name = "reset_new_pass.html"
    success_url = '/user/login/'
    form_class = SetPasswordForm

    def post(self, request, id=None, token=None, *arg, **kwargs):
        UserModel = get_user_model()
        form = self.form_class(request.POST)
        assert id is not None and token is not None
        try:
            user = UserModel._default_manager.get(pk=id)
            # print(user)

        except (TypeError, ValueError, OverflowError, UserModel.DoesNotExist):
            user = None

        if user is not None and default_token_generator.check_token(user, token):
            # print(user)
            if form.is_valid():
                # print(form)
                new_password = form.cleaned_data['new_password2']
                # print(new_password)

                user.set_password(new_password)
                user.save()
                messages.success(request, 'Password has been reset.')
                return self.form_valid(form)
            else:
                messages.error(request, 'Password reset has not been unsuccessful.')
                return self.form_invalid(form)
        else:
            messages.error(request, 'The reset password link is no longer valid.')
            return self.form_invalid(form)


def get_state(request):
    country_id = request.GET.get('country_id')
    if request.method == 'GET':
        qs = State.objects.filter(country_id=country_id).order_by('name')
        data = [{
            'id': qs.id,
            'name': qs.name,
        } for qs in qs]

        return JsonResponse({'data': data})


def get_transaction_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    user_id = request.session['id']
    objects = Q(user_id=user_id)
    if search:
        search_str = search.split(' ')
        objects = objects & (Q(order_id__icontains=search_str[0]) |
                             Q(user_email__icontains=search_str[0]) |
                             Q(payment_status__icontains=search_str[0]) |
                             Q(payment_mode__icontains=search_str[0]) |
                             Q(amount__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(order_id__icontains=term) |
                             Q(user_email__icontains=term) |
                             Q(payment_status__icontains=term) |
                             Q(payment_mode__icontains=term) |
                             Q(amount__icontains=term)), Q.AND)

    lst_stmt = Payment.objects.filter(objects).order_by('id')[int(start):(int(last) + int(start))]
    q = Payment.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = [inc, i.order_id]
        membership_plan = ''
        if i.plan:
            membership_plan = i.plan.omp_name

        doc_list1.append(membership_plan)
        doc_list1.append(i.payment_for)
        doc_list1.append(i.payment_status)
        doc_list1.append(i.user_email)
        date_obj = get_plan_date(i.user.id)
        start_date = date_obj['plan_start_date']
        end_date = date_obj['plan_end_date']
        doc_list1.append(start_date)
        doc_list1.append(end_date)
        doc_list1.append('<div class="new_receipt" <a href="/user/invoice_generate/'+str(i.id)+'/" class="btn btn-primary" download><i class="fa fa-download" aria-hidden="true"></i></a></div>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


def get_admin_transaction_list(request):
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    user_id = request.session['id']
    objects = Q()
    if search:
        search_str = search.split(' ')
        objects = objects & (Q(order_id__icontains=search_str[0]) |
                             Q(user_email__icontains=search_str[0]) |
                             Q(payment_status__icontains=search_str[0]) |
                             Q(payment_mode__icontains=search_str[0]) |
                             Q(amount__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(order_id__icontains=term) |
                             Q(user_email__icontains=term) |
                             Q(payment_status__icontains=term) |
                             Q(payment_mode__icontains=term) |
                             Q(amount__icontains=term)), Q.AND)

    lst_stmt = Payment.objects.filter(objects).order_by('id')[int(start):(int(last) + int(start))]
    q = Payment.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        doc_list1.append(i.order_id)
        doc_list1.append(i.payment_for)
        doc_list1.append(i.payment_status)
        doc_list1.append(i.user_email)
        date_obj = get_plan_date(i.user.id)
        start_date = date_obj['plan_start_date']
        end_date = date_obj['plan_end_date']
        doc_list1.append(start_date)
        doc_list1.append(end_date)
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


@login_required
def admin_transaction(request):
    return render(request, 'admin_transaction.html')


def get_plan_date(user_id):
    try:
        user_obj = CustomUser.objects.get(id=user_id)
        plan_start_date = ''
        plan_end_date = ''
        if user_obj.start_date:
            plan_start_date = get_date_format(user_obj.start_date, '%Y-%m-%d')

        if user_obj.end_date:
            plan_end_date = get_date_format(user_obj.end_date, '%Y-%m-%d')
    except:
        plan_start_date = ''
        plan_end_date = ''
    plan_dict = {'plan_start_date': plan_start_date, 'plan_end_date': plan_end_date}

    return plan_dict


def get_date_format(date_obj, date_format):
    date_str = str(date_obj.date())
    date = datetime.strptime(date_str, date_format)
    date = date.strftime('%d-%m-%Y')
    return date


def user_list(request):
    user_type = request.session['user_type']
    if user_type == 1:
        base_template = 'admin_base.html'
    else:
        base_template = 'base.html'
    return render(request, 'user_list.html', {'user_type': user_type, 'base_template': base_template})


def multi_part(request):
    if request.method == 'POST':
        form = request.POST
        trf_owner_name = form.getlist('trf_owner_name[]')
        trf_personal_address = form.getlist('trf_personal_address[]')
        trf_phone = form.getlist('trf_phone[]')
        trf_email = form.getlist('trf_email[]')
        facility_ceo_name = form.get('facility_ceo_name')
        facility_ceo_phone = form.get('facility_ceo_phone')
        facility_ceo_email = form.get('facility_ceo_email')
        medical_director_name = form.get('medical_director_name')
        medical_director_phone = form.get('medical_director_phone')
        medical_director_email = form.get('medical_director_email')
        cnt_aaqf_name = form.get('cnt_aaqf_name')
        cnt_aaqf_phone = form.get('cnt_aaqf_phone')
        cnt_aaqf_email = form.get('cnt_aaqf_email')
        acnt_name = form.get('acnt_name')
        acnt_phone = form.get('acnt_phone')
        acnt_email = form.get('acnt_email')
        web_facility_type = form.get('web_facility_type')
        providers = form.get('providers')
        others = form.get('others')
        tax_identification_no = form.get('tax_identification_no')
        accreditation = form.get('accreditation')
        submit = form.get('submit')
        if submit == 'save':
            save_as = 1
        else:
            save_as = 2

        user_id = request.session['id']
        user_obj = UserInfo.objects.create(user_id=user_id,
                                           facility_ceo_name=facility_ceo_name,
                                           facility_ceo_phone=facility_ceo_phone,
                                           facility_ceo_email=facility_ceo_email,
                                           medical_director_name=medical_director_name,
                                           medical_director_phone=medical_director_phone,
                                           medical_director_email=medical_director_email,
                                           cnt_aaqf_name=cnt_aaqf_name,
                                           cnt_aaqf_phone=cnt_aaqf_phone,
                                           cnt_aaqf_email=cnt_aaqf_email,
                                           acnt_name=acnt_name,
                                           acnt_phone=acnt_phone,
                                           acnt_email=acnt_email,
                                           web_facility_type=web_facility_type,
                                           providers=providers,
                                           tax_identification_no=tax_identification_no,
                                           accreditation_id=accreditation,
                                           others=others,
                                           save_as=save_as)
        if user_obj:
            for i in range(len(trf_owner_name)):
                UserInfoMapping.objects.create(user_info_id=user_obj.id,
                                               trf_owner_name=trf_owner_name[i],
                                               trf_personal_address=trf_personal_address[i],
                                               trf_phone=trf_phone[i],
                                               trf_email=trf_email[i])

        return redirect(
            '/payment/accreditation_checkout/?mid=' + str(accreditation) + '&uid=' + str(user_id) + '&insert_id=' + str(
                user_obj.id))

    else:
        accreditation = OmMembershipPlan.objects.filter(id=1)
        list_plans = []
        for i in accreditation:
            dict_plans = {'id': i.omp_id, 'omp_code': i.omp_code, 'omp_name': i.omp_name, 'omp_desc': i.omp_desc,
                          'omp_price': i.omp_price, 'omp_duration': i.omp_duration, 'omp_plan_type': i.omp_plan_type}
            list_plans.append(dict_plans)
        return render(request, 'multi_part.html', {'list_plans': list_plans})


def certificate(requests):
    return render(requests, 'certificate.html')


def user_suspend_delete(request):
    msg = 'Something went wrong.'
    if request.method == 'GET':
        user_id = request.GET.get('user_id')
        flag = request.GET.get('flag')
        if flag == 'suspend':
            CustomUser.objects.filter(pk=user_id).update(is_suspend=1)
            msg = 'User suspended Successfully'
        else:
            CustomUser.objects.filter(pk=user_id).update(is_delete=1)
            msg = 'User deleted Successfully'
    return JsonResponse({'message': msg})


def send_email(request, to_email='xyz@gmail.com'):
    mail_subject = "Registration"
    message = "Registration successfully..."
    send_mail(
        subject=mail_subject,
        message=message,
        from_email=settings.EMAIL_HOST_USER,
        recipient_list=[to_email],
        fail_silently=True,
    )
    return "Done"


def add_user(request):
    user_id = request.session['id']
    if request.method == 'POST':
        form = request.POST
        prefix = form.get('prefix')
        first_name = form.get('first_name')
        middle_name = form.get('middle_name')
        last_name = form.get('last_name')
        suffix = form.get('suffix')
        organization = form.get('organization')
        title = form.get('title')
        mailingaddress = form.get('mailingaddress')
        address_line2 = form.get('address_line2')
        city = form.get('city')
        adr_country = form.get('adr_country')
        adr_state = form.get('adr_state')
        adr_post_code = form.get('adr_post_code')
        adr_intl_province = form.get('adr_intl_province')
        eml_address = form.get('eml_address')
        new_password = form.get('new_password')
        membership_id = form.get('membership_id')
        is_admin = form.get('is_admin')
        if is_admin == 'True':
            membership_id = form.get('membership_id')
            payment_status = form.get('payment_status')
            p_mode = form.get('p_mode')
        else:
            membership_id = ''
            payment_status = 1
            p_mode = 2

        try:
            qs = CustomUser.objects.create_user(username=eml_address, email=eml_address, user_op_id=prefix,
                                                first_name=first_name, last_name=last_name, middle_name=middle_name,
                                                organization=organization, title=title,
                                                address1=mailingaddress, address2=address_line2, city=city,
                                                user_oc_id=adr_country, zip_code=adr_post_code,
                                                membership_id=membership_id, created_by_id=user_id,
                                                mode_of_payment_id=p_mode, payment_status_id=payment_status,
                                                password=new_password)
            if qs:
                if adr_state:
                    qs.user_ost_id = adr_state
                    qs.save()
                send_email(request, eml_address)
                success = 1

            else:
                messages.success(request, 'Could not registered')
                success = 0

        except Exception as e:
            print(e, 'Error At Line 109')
            messages.success(request, e)
            success = 0
        user_type = request.session['user_type']
        if user_type == 1:
            base_template = 'admin_base.html'
        else:
            base_template = 'base.html'
        return render(request, 'add_user.html',
                      {'success': success, 'user_type': user_type, 'base_template': base_template})

    else:
        user_type = request.session['user_type']
        if user_type == 1:
            base_template = 'admin_base.html'
        else:
            base_template = 'base.html'
        mid = request.GET.get('mid')
        prefix = OmPrefix.objects.all().order_by('op_name')
        suffix = OmSuffix.objects.all().order_by('os_name')
        country = Country.objects.all().order_by('name')
        return render(request, 'add_user.html', {'mid': mid, 'prefix': prefix, 'suffix': suffix,
                                                 'country': country, 'user_type': user_type,
                                                 'base_template': base_template})


def edit_user(request):
    user_type = request.session['user_type']
    if user_type == 1:
        base_template = 'admin_base.html'
    else:
        base_template = 'base.html'
    return render(request, 'edit_user.html', {'user_type': user_type, 'base_template': base_template})


def check_email_exist(request):
    pass


@login_required()
def get_user_list(request):
    user_id = request.session['id']
    start = request.GET.get('start')
    last = request.GET.get('length')
    search = request.GET.get('search')
    user_type = request.session['user_type']
    objects = ~Q(user_type=5)
    if user_type != 1:
        objects = Q(created_by_id=user_id)
    if search:
        search_str = search.split(' ')
        objects = objects & (Q(email__icontains=search_str[0]) |
                             Q(first_name__icontains=search_str[0]) |
                             Q(title__icontains=search_str[0]) |
                             Q(username__icontains=search_str[0]))
        for term in search_str[1:]:
            if term != '':
                objects.add((Q(email__icontains=term) |
                             Q(first_name__icontains=term) |
                             Q(title__icontains=term) |
                             Q(username__icontains=term)), Q.AND)

    if user_type != 1 or user_type != 5:
        objects = objects & Q(is_suspend=0) & Q(is_delete=0)

    lst_stmt = CustomUser.objects.filter(objects).order_by('id')[int(start):(int(last) + int(start))]
    q = CustomUser.objects.filter(objects)
    lst_count = len(q)
    doc_list = []
    inc = int(start) + 1

    for i in lst_stmt:
        doc_list1 = []
        doc_list1.append(inc)
        name = ''
        if i.first_name and i.last_name:
            name = i.first_name + ' ' + i.last_name
        doc_list1.append('<a href="#" class="user-link">' + str(name) + '</a> <span class="user-subhead"></span>')
        if i.membership:
            member_type = i.membership.omp_name
        else:
            member_type = 'Normal User'
        doc_list1.append('<a href="#" class="user-link">' + str(member_type) + '</a> <span class="user-subhead"></span>')
        created_dt = ''
        if i.created_dt:
            created_dt = get_date_format(i.created_dt, '%Y-%m-%d')
        doc_list1.append(created_dt)

        doc_list1.append('<a href="#">' + str(i.email) + '</a>')

        doc_list1.append('<span data-attr-value="suspend" onclick="suspend_delete(' + str(
            i.pk) + ', \'' + 'suspend' + '\')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-search-plus '
                                         'fa-stack-1x fa-inverse"></i></span><a href="/user/update_profile/' + str(
            i.pk) + '/"'
                    'class="table-link text-info"><span class="fa-stack"><i class="fa fa-square '
                    'fa-stack-2x"></i><i class="fa fa-pencil fa-stack-1x fa-inverse"></i></span></a><span data-attr-value="suspend" onclick="suspend_delete(' + str(
            i.pk) + ', \'' + 'delete' + '\')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i '
                                        'class="fa fa-trash-o fa-stack-1x fa-inverse"></i></span><span data-attr-value="change_password" onclick="change_password(' + str(
            i.pk) + ')" class="fa-stack"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-key '
                    'fa-stack-1x fa-inverse"></i></span>')
        doc_list.append(doc_list1)
        inc += 1

    data = {'draw': request.GET.get('draw'), 'recordsTotal': lst_count, 'recordsFiltered': lst_count,
            'data': doc_list}
    return JsonResponse(data)


def invoice_generate(request, download_id):
    logo_img = request.build_absolute_uri('')
    filename = "invoice_receipt.pdf"
    payment_obj = Payment.objects.get(id=int(download_id))
    context = {
        'logo_img': logo_img,
        'invoice_no': payment_obj.id,
        'payment_date': payment_obj.created_dt,
        'user_name': payment_obj.user.first_name + '' + payment_obj.user.last_name,
        'phone_number': payment_obj.user.phone_number,
        'email': payment_obj.user.email,
        'address1': payment_obj.user.address1,
        'city': payment_obj.user.city,
        'zip_code': payment_obj.user.zip_code,
        'state': payment_obj.user.user_ost.name,
        'country': payment_obj.user.user_oc.name,
        'plan_name': payment_obj.plan.omp_name,
        'start_date': payment_obj.user.start_date,
        'end_date': payment_obj.user.end_date,
        'total_amount': payment_obj.amount
    }
    html_file = 'invoice.html'
    response = render_to_pdf_download(request, html_file, filename, context)
    return response


def render_to_pdf_download(request, html_file, filename, context={}):
    from weasyprint import CSS, HTML
    from weasyprint.fonts import FontConfiguration
    response = HttpResponse(content_type="application/pdf")
    response['Content-Disposition'] = "attachment; filename=" + filename
    html = render_to_string(html_file, context)
    font_config = FontConfiguration()
    css = CSS(string='img { border:none; height:35px;float:left;}'
              'table {border-collapse; width=100%}')
    HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(response, stylesheets=[css], font_config=font_config)
