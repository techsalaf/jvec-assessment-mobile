from django.db import models
from django.core.validators import RegexValidator

class Contact(models.Model):
    first_name = models.CharField(max_length=255, validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Only letters are allowed.')])
    last_name = models.CharField(max_length=255, validators=[RegexValidator(regex='^[a-zA-Z]*$', message='Only letters are allowed.')])
    phone_number = models.CharField(max_length=15, validators=[RegexValidator(regex='^[0-9]*$', message='Only numbers are allowed.')])

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
