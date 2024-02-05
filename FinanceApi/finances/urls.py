from django.urls import path, include
from rest_framework import routers 
from .views import UsersViewSet, UsersPaymentList, PaymentViewSet

router = routers.DefaultRouter()
router.register('users', UsersViewSet, basename='Users')
router.register('payment', PaymentViewSet, basename='Payment')

urlpatterns = [
    path('', include(router.urls)),
    path('get-users-payment/<int:pk>/payment', UsersPaymentList.as_view())
]
