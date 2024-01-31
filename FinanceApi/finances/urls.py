from django.urls import path, include
from rest_framework import routers 
from .views import UsersViewSet

router = routers.DefaultRouter()
router.register('users', UsersViewSet, basename='USERS')

urlpatterns = [
    path('', include(router.urls) )
]
