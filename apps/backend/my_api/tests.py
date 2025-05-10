from django.test import TestCase
from rest_framework.test import APIClient
from rest_framework import status
from .models import Nonprofit, Project, Campaign, TeamMember, Testimonial, Donation, Volunteer

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

class CampaignAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.campaign_data = {
            'title': 'Test Campaign',
            'description': 'A test campaign',
            'image': 'campaign_images/test.jpg',
            'target_amount': '1000.00',
            'raised_amount': '0.00',
            'start_date': '2023-01-01',
            'end_date': '2023-12-31',
            'is_featured': False
        }
        self.campaign = Campaign.objects.create(**self.campaign_data)

    def test_create_campaign(self):
        response = self.client.post('/api/campaigns/', self.campaign_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['title'], self.campaign_data['title'])

    def test_get_campaign(self):
        response = self.client.get(f'/api/campaigns/{self.campaign.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['title'], self.campaign_data['title'])

    def test_update_campaign(self):
        updated_data = {
            'title': 'Updated Campaign',
            'description': 'An updated test campaign',
            'image': 'campaign_images/updated.jpg',
            'target_amount': '2000.00',
            'raised_amount': '100.00',
            'start_date': '2023-01-01',
            'end_date': '2023-12-31',
            'is_featured': True
        }
        response = self.client.put(f'/api/campaigns/{self.campaign.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['title'], updated_data['title'])

    def test_delete_campaign(self):
        response = self.client.delete(f'/api/campaigns/{self.campaign.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(Campaign.objects.filter(id=self.campaign.id).exists())

class TeamMemberAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.team_member_data = {
            'name': 'Test Member',
            'position': 'Developer',
            'bio': 'A test team member',
            'image': 'team_images/test.jpg',
            'social_links': {}
        }
        self.team_member = TeamMember.objects.create(**self.team_member_data)

    def test_create_team_member(self):
        response = self.client.post('/api/team/', self.team_member_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['name'], self.team_member_data['name'])

    def test_get_team_member(self):
        response = self.client.get(f'/api/team/{self.team_member.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], self.team_member_data['name'])

    def test_update_team_member(self):
        updated_data = {
            'name': 'Updated Member',
            'position': 'Lead Developer',
            'bio': 'An updated test team member',
            'image': 'team_images/updated.jpg',
            'social_links': {}
        }
        response = self.client.put(f'/api/team/{self.team_member.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], updated_data['name'])

    def test_delete_team_member(self):
        response = self.client.delete(f'/api/team/{self.team_member.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(TeamMember.objects.filter(id=self.team_member.id).exists())

class TestimonialAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.testimonial_data = {
            'author': 'Test Author',
            'role': 'Donor',
            'content': 'A test testimonial',
            'image': 'testimonial_images/test.jpg',
            'rating': 5
        }
        self.testimonial = Testimonial.objects.create(**self.testimonial_data)

    def test_create_testimonial(self):
        response = self.client.post('/api/testimonials/', self.testimonial_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['author'], self.testimonial_data['author'])

    def test_get_testimonial(self):
        response = self.client.get(f'/api/testimonials/{self.testimonial.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['author'], self.testimonial_data['author'])

    def test_update_testimonial(self):
        updated_data = {
            'author': 'Updated Author',
            'role': 'Major Donor',
            'content': 'An updated test testimonial',
            'image': 'testimonial_images/updated.jpg',
            'rating': 4
        }
        response = self.client.put(f'/api/testimonials/{self.testimonial.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['author'], updated_data['author'])

    def test_delete_testimonial(self):
        response = self.client.delete(f'/api/testimonials/{self.testimonial.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(Testimonial.objects.filter(id=self.testimonial.id).exists())

class DonationAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.campaign = Campaign.objects.create(
            title='Test Campaign',
            description='A test campaign',
            image='campaign_images/test.jpg',
            target_amount='1000.00',
            raised_amount='0.00',
            start_date='2023-01-01',
            end_date='2023-12-31',
            is_featured=False
        )
        self.donor = User.objects.create_user(username='testuser', password='testpassword')
        self.donation_data = {
            'amount': '100.00',
            'donor': self.donor.id,
            'campaign': self.campaign.id,
            'date': '2023-01-01',
            'anonymous': False
        }
        self.donation = Donation.objects.create(**self.donation_data)

    def test_create_donation(self):
        response = self.client.post('/api/donations/', self.donation_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['amount'], self.donation_data['amount'])

    def test_get_donation(self):
        response = self.client.get(f'/api/donations/{self.donation.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['amount'], self.donation_data['amount'])

    def test_update_donation(self):
        updated_data = {
            'amount': '200.00',
            'donor': self.donor.id,
            'campaign': self.campaign.id,
            'date': '2023-01-01',
            'anonymous': True
        }
        response = self.client.put(f'/api/donations/{self.donation.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['amount'], updated_data['amount'])

    def test_delete_donation(self):
        response = self.client.delete(f'/api/donations/{self.donation.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(Donation.objects.filter(id=self.donation.id).exists())

class VolunteerAPITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.volunteer_data = {
            'name': 'Test Volunteer',
            'email': 'test@volunteer.org',
            'phone': '1234567890',
            'skills': 'Testing',
            'availability': 'Weekends'
        }
        self.volunteer = Volunteer.objects.create(**self.volunteer_data)

    def test_create_volunteer(self):
        response = self.client.post('/api/volunteers/', self.volunteer_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['name'], self.volunteer_data['name'])

    def test_get_volunteer(self):
        response = self.client.get(f'/api/volunteers/{self.volunteer.id}/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], self.volunteer_data['name'])

    def test_update_volunteer(self):
        updated_data = {
            'name': 'Updated Volunteer',
            'email': 'updated@volunteer.org',
            'phone': '0987654321',
            'skills': 'Advanced Testing',
            'availability': 'Weekdays'
        }
        response = self.client.put(f'/api/volunteers/{self.volunteer.id}/', updated_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], updated_data['name'])

    def test_delete_volunteer(self):
        response = self.client.delete(f'/api/volunteers/{self.volunteer.id}/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertFalse(Volunteer.objects.filter(id=self.volunteer.id).exists())

class AuthenticationTestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.user = User.objects.create_user(username='testuser', password='testpassword')

    def test_obtain_token(self):
        response = self.client.post('/api/token/', {'username': 'testuser', 'password': 'testpassword'}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertIn('access', response.data)
        self.assertIn('refresh', response.data)

    def test_refresh_token(self):
        obtain_response = self.client.post('/api/token/', {'username': 'testuser', 'password': 'testpassword'}, format='json')
        refresh_token = obtain_response.data['refresh']
        refresh_response = self.client.post('/api/token/refresh/', {'refresh': refresh_token}, format='json')
        self.assertEqual(refresh_response.status_code, status.HTTP_200_OK)
        self.assertIn('access', refresh_response.data)
