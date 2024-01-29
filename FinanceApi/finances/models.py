from django.db import models

class User(models.Model):
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    birth_date = models.DateField()
    age = models.PositiveIntegerField()
    profession = models.CharField(max_length=100)
    create_at = models.DateTimeField(auto_now_add=True)
    modify_at = models.DateTimeField(auto_now=True)
    delete_at =  models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.name

class Amount(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    value = models.FloatField()

    def __str__(self):
        return f"{self.user.name} - {self.value}"

class Payment(models.Model):
    amount = models.ForeignKey(Amount, on_delete=models.CASCADE)
    is_debt = models.BooleanField(default=False)
    value = models.FloatField()
    description = models.CharField(max_length=255)
    create_at = models.DateTimeField(auto_now_add=True)
    modify_at = models.DateTimeField(auto_now=True)
    delete_at =  models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"{self.amount.user.name} - {self.value}"

class Tag(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=255)
    create_at = models.DateTimeField(auto_now_add=True)
    modify_at = models.DateTimeField(auto_now=True)
    delete_at =  models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.name

class PaymentHasTag(models.Model):
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE)
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.payment.amount.user.name} - {self.tag.name}"
