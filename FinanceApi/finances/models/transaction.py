from django.db import models
from .user import User

class Transaction(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    is_debt = models.BooleanField(default=False)
    value = models.FloatField()
    description = models.CharField(max_length=255)
    create_at = models.DateTimeField(auto_now_add=True)
    modify_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.name} - {self.value}"