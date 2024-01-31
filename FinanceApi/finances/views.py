from rest_framework import viewsets, generics
from .serializer import UserSerializers, UsersPaymentSerializer
from .models.user import User

class UsersViewSet(viewsets.ModelViewSet):
    """Return all users"""
    queryset = User.objects.all()
    serializer_class = UserSerializers

class UsersPaymentList(generics.ListAPIView):
    """return User payment"""
    

