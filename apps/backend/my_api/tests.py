from django.test import TestCase
from rest_framework.test import APIClient
from rest_framework import status
from .models import Nonprofit, Project

class NonprofitAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.nonprofit_data = {'name': 'Test Nonprofit', 'description': 'A test nonprofit', 'website': 'http://testnonprofit.org'}
        self.nonprofit = Nonprofit.objects.create(**self.nonprofit_data)

    def test_create_nonprofit(self):
        response = self.client.post('/api/nonprofits/', self.nonprofit_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['name'], self.nonprofit_data['name'])

    def test_get_nonprofit(self):
        response = self.client.get(f'/api/nonprofits/{self.nonprofit.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], self.nonprofit_data['name'])

    def test_update_nonprofit(self):
        updated_data = {'name': 'Updated Nonprofit', 'description': 'An updated test nonprofit', 'website': 'http://updatednonprofit.org'}
        response = self.client.put(f'/api/nonprofits/{self.nonprofit.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], updated_data['name'])

    def test_delete_nonprofit(self):
        response = self.client.delete(f'/api/nonprofits/{self.nonprofit.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(Nonprofit.objects.filter(id=self.nonprofit.id).exists())

class ProjectAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.nonprofit = Nonprofit.objects.create(name='Test Nonprofit', description='A test nonprofit', website='http://testnonprofit.org')
        self.project_data = {'nonprofit': self.nonprofit.id, 'title': 'Test Project', 'description': 'A test project', 'start_date': '2023-01-01', 'end_date': '2023-12-31'}
        self.project = Project.objects.create(nonprofit=self.nonprofit, **self.project_data)

    def test_create_project(self):
        response = self.client.post('/api/projects/', self.project_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['title'], self.project_data['title'])

    def test_get_project(self):
        response = self.client.get(f'/api/projects/{self.project.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['title'], self.project_data['title'])

    def test_update_project(self):
        updated_data = {'nonprofit': self.nonprofit.id, 'title': 'Updated Project', 'description': 'An updated test project', 'start_date': '2023-01-01', 'end_date': '2023-12-31'}
        response = self.client.put(f'/api/projects/{self.project.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['title'], updated_data['title'])

    def test_delete_project(self):
        response = self.client.delete(f'/api/projects/{self.project.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(Project.objects.filter(id=self.project.id).exists())
