from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import (
    NonprofitListCreateView, NonprofitDetailView, ProjectListCreateView, ProjectDetailView,
    CampaignListView, CampaignDetailView, FeaturedCampaignsView, TeamListView, TestimonialListView,
    DonationCreateView, VolunteerCreateView, CustomTokenObtainPairView, CustomTokenRefreshView
)
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from rest_framework import permissions

schema_view = get_schema_view(
    openapi.Info(
        title="Nonprofit Project API",
        default_version='v1',
        description="API documentation for the Nonprofit Project",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="contact@nonprofitproject.org"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('nonprofits/', NonprofitListCreateView.as_view(), name='nonprofit-list-create'),
    path('nonprofits/<int:pk>/', NonprofitDetailView.as_view(), name='nonprofit-detail'),
    path('projects/', ProjectListCreateView.as_view(), name='project-list-create'),
    path('projects/<int:pk>/', ProjectDetailView.as_view(), name='project-detail'),
    path('campaigns/', CampaignListView.as_view(), name='campaign-list'),
    path('campaigns/<int:pk>/', CampaignDetailView.as_view(), name='campaign-detail'),
    path('campaigns/featured/', FeaturedCampaignsView.as_view(), name='featured-campaigns'),
    path('team/', TeamListView.as_view(), name='team-list'),
    path('testimonials/', TestimonialListView.as_view(), name='testimonial-list'),
    path('donations/', DonationCreateView.as_view(), name='donation-create'),
    path('volunteers/', VolunteerCreateView.as_view(), name='volunteer-create'),
    path('api/token/', CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', CustomTokenRefreshView.as_view(), name='token_refresh'),
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]
