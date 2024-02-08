from rest_framework import serializers
from .models.user import User
from .models.transaction import Transaction

class UserSerializers(serializers.ModelSerializer):
    class Meta: 
        model = User
        fields = '__all__'


class TransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transaction
        fields = '__all__'

class UsersTransactionSerializer(serializers.ModelSerializer):
    user_name = serializers.ReadOnlyField(source='user.name')
    class Meta:
        model = Transaction
        fields = ['user_name', 'is_debt', 'value', 'description', 'create_at']










