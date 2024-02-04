from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(OmPrefix)
admin.site.register(OmSuffix)
admin.site.register(Country)
admin.site.register(State)
admin.site.register(OmMembershipPlan)
admin.site.register(CustomUser)
