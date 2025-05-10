from rest_framework import serializers
from .models import Nonprofit, Project

class NonprofitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nonprofit
        fields = ['id', 'name', 'description', 'website']

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ['id', 'nonprofit', 'title', 'description', 'start_date', 'end_date']
