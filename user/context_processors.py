from .models import CustomUser, OmMembershipPlan
from django.db.models import F
from django.contrib.auth.decorators import login_required


def get_user_role(request):
    user_id = request.user.id
    membership_code = ''
    is_admin = False

    try:
        membership_code = request.user.membership.omp_code
        is_admin = request.user.admin_user

    except:
        pass

    if is_admin == False:
        base_temp = 'base.html'
    else:
        base_temp = 'admin_base.html'

    context = {
        'global_role': membership_code,
        'global_is_admin': is_admin,
        'base_temp': base_temp
    }

    print(context, 'context')

    return context

def membership_details(request):
    try:
        user_id = request.user.id
        membership = OmMembershipPlan.objects.values(id=F('omp_id'), code=F('omp_code'), name=F('omp_name'))
        return {'membership':list(membership)}
    except:
        return {'':''}

def user_details(request):
    try:
        user_id = request.user.id
        user_details = CustomUser.objects.values(user_id=F('id'), name=F('username'))
        return {'user_details':list(user_details)}
    except Exception as e:
        print(e, 'jjjjjjjjjjjjj')
        return {'':''}
