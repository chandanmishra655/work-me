from datetime import datetime
from django.http import HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.urls import reverse
from django.utils.decorators import decorator_from_middleware_with_args


class SessionExpiredMiddleware:

    def process_request(request):
        last_activity = request.session['last_activity']
        now = datetime.now()

        if (now - last_activity).minutes > 10:
            # Do logout / expire session
            # and then...
            return HttpResponseRedirect('/user/login/')

        if not request.is_ajax():
            # don't set this for ajax requests or else your
            # expired session checks will keep the session from
            # expiring :)
            request.session['last_activity'] = now


class timeOutMiddleware(object):


    def process_request(self, request):
        shouldLogout = False
        if request.user.is_authenticated():
            if 'beginSession' in request.session:
                elapsedTime = datetime.now() - \
                              request.session['beginSession']
                if elapsedTime.seconds > 24*3600:
                    del request.session['beginSession']
                    shouldLogout = True
            else:
                request.session['beginSession'] = datetime.now()

            if 'lastRequest' in request.session:
                elapsedTime = datetime.now() - \
                              request.session['lastRequest']
                if elapsedTime.seconds > 60*60:
                    del request.session['lastRequest']
                    shouldLogout = True

            request.session['lastRequest'] = datetime.now()

            if shouldLogout:
                logout(request)

        else:
            if 'beginSession' in request.session:
                del request.session['beginSession']
            if 'lastRequest' in request.session:
                del request.session['lastRequest']

        return None


class AuthRequiredMiddleware(object):
    print('user_is active')
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        return self.get_response(request)

    def process_request(self, request):
        if request.user.is_authenticated:
            next = request.GET.get('next')
            print('user_is active')
            return HttpResponseRedirect('/home/') # or http response
        return None


class AccountExpiry:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        current_user = request.user
        response = self.get_response(request)
        expiry_path = reverse('user:logout')

        if current_user.is_anonymous is False:

            if request.path not in [expiry_path]:
                expiry_date = current_user.end_date
                todays_date = datetime.today().date()
                # print(datetime.today().date())
                # print(current_user.end_date)

                # if todays_date > expiry_date:
                #     return HttpResponseRedirect(expiry_path)
        return response


#AccountExpiry1 = decorator_from_middleware_with_args(AccountExpiry)

