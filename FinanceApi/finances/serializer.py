from rest_framework import serializers
from .models.user import User
from .models.payment import Payment

class UserSerializers(serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = '__all__'


class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = '__all__'

class UsersPaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = '__all__'