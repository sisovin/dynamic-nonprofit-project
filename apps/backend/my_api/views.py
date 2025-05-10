from rest_framework import generics
from .models import Nonprofit, Project, Campaign, TeamMember, Testimonial, Donation, Volunteer
from .serializers import NonprofitSerializer, ProjectSerializer, CampaignSerializer, TeamMemberSerializer, TestimonialSerializer, DonationSerializer, VolunteerSerializer
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

class NonprofitListCreateView(generics.ListCreateAPIView):
    queryset = Nonprofit.objects.all()
    serializer_class = NonprofitSerializer

class NonprofitDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Nonprofit.objects.all()
    serializer_class = NonprofitSerializer

class ProjectListCreateView(generics.ListCreateAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer

class ProjectDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer

class CampaignListView(generics.ListAPIView):
    queryset = Campaign.objects.all()
    serializer_class = CampaignSerializer

class CampaignDetailView(generics.RetrieveAPIView):
    queryset = Campaign.objects.all()
    serializer_class = CampaignSerializer

class FeaturedCampaignsView(generics.ListAPIView):
    queryset = Campaign.objects.filter(is_featured=True)
    serializer_class = CampaignSerializer

class TeamListView(generics.ListAPIView):
    queryset = TeamMember.objects.all()
    serializer_class = TeamMemberSerializer

class TestimonialListView(generics.ListAPIView):
    queryset = Testimonial.objects.all()
    serializer_class = TestimonialSerializer

class DonationCreateView(generics.CreateAPIView):
    queryset = Donation.objects.all()
    serializer_class = DonationSerializer

class VolunteerCreateView(generics.CreateAPIView):
    queryset = Volunteer.objects.all()
    serializer_class = VolunteerSerializer

class CustomTokenObtainPairView(TokenObtainPairView):
    permission_classes = (IsAuthenticated,)

class CustomTokenRefreshView(TokenRefreshView):
    permission_classes = (IsAuthenticated,)
