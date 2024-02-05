from django.contrib import admin
from .models.user import User
from .models.transaction import Transaction

# Register your models here.
class Users(admin.ModelAdmin):
    list_display = ('id', 'name', 'amount', 'birth_date', 'profession')
    list_display_links = ('id', 'name')
    search_fields = ('name',)
    list_per_page = 20 

admin.site.register(User, Users)

class Transactions(admin.ModelAdmin):
    list_display = ('id', 'user_id', 'value', 'is_debt', 'description')
    list_display_links = ('id',)
    search_fields = ('value',)
    list_per_page = 20 

admin.site.register(Transaction, Transactions)

