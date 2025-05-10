from django.urls import path
from .views import NonprofitListCreateView, NonprofitDetailView, ProjectListCreateView, ProjectDetailView

urlpatterns = [
    path('nonprofits/', NonprofitListCreateView.as_view(), name='nonprofit-list-create'),
    path('nonprofits/<int:pk>/', NonprofitDetailView.as_view(), name='nonprofit-detail'),
    path('projects/', ProjectListCreateView.as_view(), name='project-list-create'),
    path('projects/<int:pk>/', ProjectDetailView.as_view(), name='project-detail'),
]
