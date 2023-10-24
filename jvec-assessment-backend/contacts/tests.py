from django.contrib.auth.models import User
from rest_framework.test import APITestCase
from rest_framework import status
from .models import Contact

# contacts/tests.py

class ContactAPITest(APITestCase):
    def setUp(self):
        self.user = User.objects.create_user(username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)

    def test_create_contact(self):
        data = {'first_name': 'John', 'last_name': 'Doe', 'phone_number': '1234567890'}
        response = self.client.post('/contacts/', data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Contact.objects.count(), 1)
        self.assertEqual(Contact.objects.get().first_name, 'John')

    def test_update_contact(self):
        contact = Contact.objects.create(first_name='Jane', last_name='Doe', phone_number='9876543210')
        updated_data = {'first_name': 'Janet', 'last_name': 'Doe', 'phone_number': '9876543210'}
        response = self.client.put(f'/contacts/{contact.id}/', updated_data)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Contact.objects.get(id=contact.id).first_name, 'Janet')
