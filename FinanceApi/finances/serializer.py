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
    user_name = serializers.ReadOnlyField(source='user.name')
    class Meta:
        model = Payment
        fields = 'user_name, is_debt, value, description, create_at'










