from django.urls import path
from .views import ContactListCreateView, ContactRetrieveUpdateDeleteView

urlpatterns = [
    path('contacts/', ContactListCreateView.as_view(), name='contact-list-create'),
    path('contacts/<int:pk>/', ContactRetrieveUpdateDeleteView.as_view(), name='contact-retrieve-update-delete'),
]
