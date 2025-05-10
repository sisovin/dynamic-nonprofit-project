from rest_framework import generics
from .models import Nonprofit, Project
from .serializers import NonprofitSerializer, ProjectSerializer

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
