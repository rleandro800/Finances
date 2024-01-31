from django.db import models

class User(models.Model):
    name = models.CharField(max_length=60)
    email = models.CharField(max_length=100)
    birth_date = models.DateField()
    amount = models.FloatField(default=0)
    profession = models.CharField(max_length=100, null=True)
    create_at = models.DateTimeField(auto_now_add=True)
    modify_at = models.DateTimeField(auto_now=True)
    delete_at =  models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.name