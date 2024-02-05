from django.urls import path, include
from rest_framework import routers 
from .views import UsersViewSet, UsersTransactionList, TransactionViewSet

router = routers.DefaultRouter()
router.register('users', UsersViewSet, basename='Users')
router.register('payment', TransactionViewSet, basename='Transaction')

urlpatterns = [
    path('', include(router.urls)),
    path('get-users-payment/<int:pk>/payment', UsersTransactionList.as_view())
]
