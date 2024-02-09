import os
import socket
import time

from django.conf import settings
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.tokens import default_token_generator
from django.core.mail import send_mail
from django.db.models import Q
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.template import loader
from django.template.loader import render_to_string
from django.views.generic import FormView

from aaqf.settings import DEFAULT_FROM_EMAIL
from datetime import datetime, timedelta

from accounts.models import UserInfo
from user.models import OmMembershipPlan, CustomUser
from .models import *
import json
import stripe
from dotenv import load_dotenv, find_dotenv
from urllib.parse import urlparse
# Create your views here.


# Setup Stripe python client library
load_dotenv(find_dotenv())

stripe.api_version = '2020-08-27'
# stripe.api_key = os.getenv('STRIPE_SECRET_KEY')
stripe.api_key = settings.STRIPE_SECRET_KEY


def checkout_page(request):
    key = settings.STRIPE_PUBLISHABLE_KEY
    mid = request.GET.get('mid')
    uid = request.GET.get('uid')
    if uid and mid:
        try:
            get_user = CustomUser.objects.get(id=int(uid))
            uid = get_user.id
            mid = get_user.membership.omp_id
            plan_name = get_user.membership.omp_name
            plan_price = get_user.membership.omp_price
            plan_desc = get_user.membership.omp_desc

        except Exception as e:
            print("Exception", e)
            uid = 0
            mid = 0
            plan_name = ''
            plan_price = 0
            plan_desc = ''
        # template is in user/template
        return render(request, 'checkout.html',
                      {'key': key, 'plan_price': plan_price, 'plan_name': plan_name, 'mid': mid, 'plan_desc': plan_desc,
                       'uid': uid})
    else:
        return render(request, 'checkout.html')

    # return render(request, 'checkout_page.html', {'key': key})


def accreditation_checkout(request):
    key = settings.STRIPE_PUBLISHABLE_KEY
    mid = request.GET.get('mid')
    uid = request.GET.get('uid')
    insert_id = request.GET.get('insert_id')
    if uid and mid:
        try:
            get_plan = OmMembershipPlan.objects.get(omp_id=int(mid))
            mid = get_plan.omp_id
            plan_name = get_plan.omp_name
            plan_price = get_plan.omp_price
            plan_desc = get_plan.omp_desc

        except Exception as e:
            print("Exception", e)
            uid = 0
            mid = 0
            plan_name = ''
            plan_price = 0
            plan_desc = ''
        return render(request, 'accreditation_checkout.html',
                      {'key': key, 'plan_price': plan_price, 'plan_name': plan_name, 'mid': mid, 'plan_desc': plan_desc,
                       'uid': uid, 'insert_id': insert_id})
    else:
        return render(request, 'accreditation_checkout.html')


def transaction(request):
    if request.method == 'POST':
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        http_host = request.META.get('HTTP_HOST')
        is_secure = request.is_secure() and "https" or "http"
        domain_url = is_secure + '://' + http_host + '/'
        uid = body['uid']
        mid = body['mid']
        if 'insert_id' in body:
            insert_id = body['insert_id']
        else:
            insert_id = 0

        plan_type = body['plan_type']
        if plan_type == 'renew':
            try:
                get_user = CustomUser.objects.get(id=int(uid))
                uid = get_user.id
                membership_id = get_user.membership.omp_id
                plan_name = get_user.membership.omp_name
                plan_price = get_user.membership.omp_price
                plan_desc = get_user.membership.omp_desc
                email = get_user.email

            except Exception as e:
                print("Exception", e)
                uid = 0
                membership_id = 0
                plan_name = ''
                plan_price = 0
                plan_desc = ''
                email = ''
        elif plan_type == 'new':
            try:
                get_user = CustomUser.objects.get(id=int(uid))
                email = get_user.email
            except:
                email = 'test@yopmail.com'
            get_plan = OmMembershipPlan.objects.get(omp_id=int(mid))
            membership_id = get_plan.omp_id
            plan_name = get_plan.omp_name
            plan_price = get_plan.omp_price
            plan_desc = get_plan.omp_desc
        elif plan_type == 'accred':
            try:
                get_user = CustomUser.objects.get(id=int(uid))
                email = get_user.email
            except:
                email = 'test@yopmail.com'
            get_plan = OmMembershipPlan.objects.get(omp_id=int(mid))
            membership_id = get_plan.omp_id
            plan_name = get_plan.omp_name
            plan_price = get_plan.omp_price
            plan_desc = get_plan.omp_desc
        else:
            uid = 0
            membership_id = 0
            plan_name = ''
            plan_price = 0
            plan_desc = ''
            email = ''

        if int(mid) == int(membership_id):
            plan_price = int(plan_price) * 100
            one_year_from_now = datetime.now() + timedelta(days=365)
            try:
                # Create new Checkout Session for the order
                # Other optional params include:
                # [billing_address_collection] - to display billing address details on the page
                # [customer] - if you have an existing Stripe Customer ID
                # [customer_email] - lets you prefill the email input in the form
                # For full details see https:#stripe.com/docs/api/checkout/sessions/create
                # ?session_id={CHECKOUT_SESSION_ID} means the redirect will have the session ID set as a query param
                order_id = generate_transaction_id(10)
                checkout_session = stripe.checkout.Session.create(
                    success_url=domain_url + 'payment/success/?session_id={CHECKOUT_SESSION_ID}',
                    cancel_url=domain_url + 'payment/canceled/',
                    payment_method_types=['card'],
                    customer_email=email,
                    mode='subscription',
                    line_items=[
                        {
                            "price": "price_1OhQYEGYzveC7pksi6s2prIm",  # Replace with your specific price ID
                            "quantity": 1,
                        },
                    ],
                )
                print(checkout_session,'++++++ this is checkout session +++++++')
                return JsonResponse({'id': checkout_session.id})
            except Exception as e:
                result = {'error': str(e), 'message': 'Payment failed'}
                return JsonResponse(result)
        else:
            result = {'error': str(e), 'message': 'Payment failed'}
            return JsonResponse(result)
    else:
        result = {'error': 'error', 'message': 'Payment failed'}
        return JsonResponse(result)


def config(request):
    key = settings.STRIPE_PUBLISHABLE_KEY
    basic_price = 100
    pro_price = 200
    jsonify = {'publishableKey': key, 'basicPrice': basic_price, 'proPrice': pro_price}
    return JsonResponse(jsonify)


def checkout_session(request):
    id = request.GET.get('sessionId')
    session_checkout = stripe.checkout.Session.retrieve(id)
    JsonResponse(session_checkout)


def success(request):
    id = request.GET.get('session_id')
    session_checkout = stripe.checkout.Session.retrieve(id)
    product_id = session_checkout['metadata']['mid']
    user_id = session_checkout['metadata']['user_id']
    insert_id = session_checkout['metadata']['insert_id']
    plan_type = session_checkout['metadata']['plan_type']
    order_id = session_checkout['metadata']['order_id']
    email = session_checkout['customer_details']['email']
    currency = session_checkout['currency']
    customer = session_checkout['customer']
    amount_total = session_checkout['amount_total']
    amount_total = float(amount_total) / 100
    transaction_id = session_checkout['payment_intent']
    payment_status = session_checkout['payment_status']

    try:
        user_obj = CustomUser.objects.get(id=int(user_id))
        add_days = user_obj.membership.omp_duration
        current_date = datetime.now()
        if plan_type == 'renew':
            end_date = user_obj.end_date + timedelta(days=int(add_days) * 30 * 12)
            payment_for = 'renew subscription'
        else:
            end_date = current_date + timedelta(days=int(add_days) * 30 * 12)
            payment_for = 'buy subscription'
        user_obj.start_date = current_date
        user_obj.end_date = end_date
        user_obj.is_subscribe = 1
        if user_obj.membership.omp_plan_type == '1':
            user_obj.user_type = 2
        elif user_obj.membership.omp_plan_type == '2':
            user_obj.user_type = 3
        elif user_obj.membership.omp_plan_type == '3':
            user_obj.user_type = 4
        user_obj.save()
        try:
            multi_part = UserInfo.objects.get(id=insert_id)
            multi_part.save_as = '1'
            multi_part.save()
        except:
            pass

        try:
            user_obj = CustomUser.objects.get(id=int(user_id))
            context = {
                'name': user_obj.membership.omp_name,
                'start_date': user_obj.start_date,
                'end_date': user_obj.end_date,
                'zip_code': user_obj.zip_code,
                'organization': user_obj.organization,
                'title': user_obj.title,
                'address1': user_obj.address1,
                'address2': user_obj.address2,
                'city': user_obj.city,
                'country': user_obj.user_oc.name,
                'state': user_obj.user_ost.name
            }
            # for attachment in word
            template_src = 'certificate_for_members.html'
            from weasyprint import HTML, CSS
            from weasyprint.fonts import FontConfiguration
            from pdf2image import convert_from_path, convert_from_bytes
            ts1 = time.time()
            path_url = 'media/certification_documents/certificate_' + str(int(ts1)) + '.pdf'
            # save pdf to folder
            html = render_to_string(template_src, context)
            pdf = HTML(string=html).write_pdf()
            path = os.path.join(os.path.dirname(os.path.dirname(__file__)) + '/' + str(path_url))
            result = open(path, 'wb')
            result.write(pdf)
            images = convert_from_path(path)
            image_path = os.path.join(os.path.dirname(os.path.dirname(__file__)) + '/media/')
            ts = time.time()
            image_name = 'certification_documents/certificate_' + str(int(ts))

            for image in images:
                img_path = image_name + '.png'
                img = image_path + img_path
                image.save(img, 'PNG')
                UserCertificate.objects.create(user_id=int(user_id),
                                               certificate=img_path,
                                               membership_id=user_obj.membership_id
                                               )
                user_obj.store_exception = img_path
            user_obj.save()
            result.close()
        except Exception as e:
            user_obj = CustomUser.objects.get(id=int(user_id))
            user_obj.store_exception = e
            user_obj.save()
            print("Error in saving pdf", e)

        Payment.objects.create(user_id=user_id, trans_id=transaction_id, user_email=email,
                               customer_ref=customer, currency=currency.upper(),
                               payment_status=payment_status,
                               payment_for=payment_for,
                               payment_mode='online', amount=amount_total,
                               order_id=order_id,
                               plan_id=product_id)

    except:
        pass

    return render(request, 'success.html')


def canceled(request):
    id = request.GET.get('session_id')
    try:
        session_checkout = stripe.checkout.Session.retrieve(id)
        product_id = session_checkout['metadata']['mid']
        user_id = session_checkout['metadata']['user_id']
        insert_id = session_checkout['metadata']['insert_id']
        plan_type = session_checkout['metadata']['plan_type']
        order_id = session_checkout['metadata']['order_id']
        email = session_checkout['customer_details']['email']
        currency = session_checkout['currency']
        customer = session_checkout['customer']
        amount_total = session_checkout['amount_total']
        amount_total = float(amount_total) / 100
        transaction_id = session_checkout['payment_intent']
        payment_status = session_checkout['payment_status']
        payment_for = 'buy subscription'
        Payment.objects.create(user_id=user_id, trans_id=transaction_id, user_email=email,
                               customer_ref=customer, currency=currency.upper(),
                               payment_status=payment_status,
                               payment_for=payment_for,
                               payment_mode='online', amount=amount_total,
                               order_id=order_id,
                               plan_id=product_id)
        try:
            multi_part = UserInfo.objects.get(id=insert_id)
            multi_part.save_as = '1'
            multi_part.save()
        except:
            pass
    except:
        pass

    return render(request, 'cancelled.html')


def create_image1(request):
    if 'id' in request.session:
        user_id = request.session['id']
    else:
        user_id = 0
    try:
        user_obj = CustomUser.objects.get(id=int(user_id))
        context = {'name': user_obj.membership.omp_name,
                   'start_date': user_obj.start_date,
                   'end_date': user_obj.end_date
                   }
        # for attachment in word
        template_src = 'certificate_for_members.html'
        from weasyprint import HTML, CSS
        from weasyprint.fonts import FontConfiguration
        from pdf2image import convert_from_path, convert_from_bytes
        ts1 = time.time()
        path_url = 'media/thumbnail/certificate_' + str(int(ts1)) + '.pdf'
        # save pdf to folder
        html = render_to_string(template_src, context)
        pdf = HTML(string=html).write_pdf()
        path = os.path.join(os.path.dirname(os.path.dirname(__file__)) + '/' + str(path_url))
        result = open(path, 'wb')
        result.write(pdf)
        images = convert_from_path(path)
        image_path = os.path.join(os.path.dirname(os.path.dirname(__file__)) + '/media/')
        ts = time.time()
        image_name = 'thumbnail/certificate' + str(int(ts))
        for image in images:
            img_path = image_name + '.png'
            img = image_path + img_path
            image.save(img, 'PNG')
            user_obj.certificate = img_path
            user_obj.store_exception = img_path
            user_obj.save()
            result.close()
    except Exception as e:
        user_obj = CustomUser.objects.get(id=int(user_id))
        user_obj.store_exception = e
        user_obj.save()
        print("Error in saving pdf", e)


def create_image(request):
    if 'id' in request.session:
        user_id = request.session['id']
    else:
        user_id = 0
    try:
        user_obj = CustomUser.objects.get(id=int(user_id))
        context = {
            'name': user_obj.membership.omp_name,
            'start_date': user_obj.start_date,
            'end_date': user_obj.end_date
        }
        # for attachment in word
        template_src = 'certificate_for_members.html'
        from weasyprint import HTML, CSS
        from weasyprint.fonts import FontConfiguration
        from pdf2image import convert_from_path, convert_from_bytes
        ts1 = time.time()
        path_url = 'media/certification_documents/certificate_' + str(int(ts1)) + '.pdf'
        # save pdf to folder
        html = render_to_string(template_src, context)
        # font_config = FontConfiguration()
        # css = CSS(string='img { border:none;height:35px;float:left; }'
        #                  'table { border-collapse:collapse; width:100%; }')
        # pdf = HTML(string=html).write_pdf(stylesheets=[css], font_config=font_config)
        pdf = HTML(string=html).write_pdf()
        path = os.path.join(os.path.dirname(os.path.dirname(__file__)) + '/' + str(path_url))
        result = open(path, 'wb')  
        result.write(pdf)
        images = convert_from_path(path)
        image_path = os.path.join(os.path.dirname(os.path.dirname(__file__)) + '/media/')
        ts = time.time()
        image_name = 'certification_documents/certificate_' + str(int(ts))
        for image in images:
            img_path = image_name + '.png'
            img = image_path + img_path
            image.save(img, 'PNG')
            user_obj.certificate = img_path
            user_obj.store_exception = img_path
        user_obj.save()
        result.close()
    except Exception as e:
        user_obj = CustomUser.objects.get(id=int(user_id))
        user_obj.store_exception = e
        user_obj.save()
        print("Error in saving pdf", e)


def renew(request):
    qs = OmMembershipPlan.objects.filter(omp_plan_type__in=[1, 2]).order_by('omp_order_by')
    key = settings.STRIPE_PUBLISHABLE_KEY
    user_id = request.session['_auth_user_id']
    user_type = 0
    if user_id:
        try:
            get_user = CustomUser.objects.get(id=int(user_id))
            uid = get_user.id
            mid = get_user.membership.omp_id
            plan_name = get_user.membership.omp_name
            plan_price = get_user.membership.omp_price
            plan_desc = get_user.membership.omp_desc
            start_date = get_user.start_date
            end_date = get_user.end_date
            user_type = get_user.user_type

        except Exception as e:
            print("Exception", e)
            uid = 0
            mid = 0
            plan_name = ''
            plan_price = 0
            plan_desc = ''
            start_date = ''
            end_date = ''
            user_type = 0
        return render(request, 'renew_subscription.html',
                      {'key': key, 'plan_price': plan_price, 'plan_name': plan_name, 'mid': int(mid), 'plan_desc': plan_desc,
                       'uid': uid, 'start_date': start_date, 'end_date': end_date, 'user_type': user_type, 'data': qs})
    else:
        return render(request, 'checkout_page.html')


def generate_transaction_id(length):
    set_number = '1234567890'
    import random
    gen_text = ''.join((random.choice(set_number)) for i in range(length))
    return gen_text
