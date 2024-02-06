from django.urls import path, include
from rest_framework import routers 
from .views import UsersViewSet, UsersTransactionList, TransactionViewSet

router = routers.DefaultRouter()
router.register('users', UsersViewSet, basename='Users')
router.register('transaction', TransactionViewSet, basename='Transaction')

urlpatterns = [
    path('', include(router.urls)),
    path('get-users-transaction/<int:pk>/transaction', UsersTransactionList.as_view())
]
