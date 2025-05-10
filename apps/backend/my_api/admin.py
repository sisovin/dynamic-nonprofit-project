from django.contrib import admin
from .models import Campaign, TeamMember, Testimonial, Donation, Volunteer

@admin.register(Campaign)
class CampaignAdmin(admin.ModelAdmin):
    list_display = ('title', 'target_amount', 'raised_amount', 'start_date', 'end_date', 'is_featured')
    search_fields = ('title', 'description')
    list_filter = ('is_featured', 'start_date', 'end_date')

@admin.register(TeamMember)
class TeamMemberAdmin(admin.ModelAdmin):
    list_display = ('name', 'position')
    search_fields = ('name', 'position')
    list_filter = ('position',)

@admin.register(Testimonial)
class TestimonialAdmin(admin.ModelAdmin):
    list_display = ('author', 'role', 'rating')
    search_fields = ('author', 'role', 'content')
    list_filter = ('rating',)

@admin.register(Donation)
class DonationAdmin(admin.ModelAdmin):
    list_display = ('amount', 'donor', 'campaign', 'date', 'anonymous')
    search_fields = ('donor__username', 'campaign__title')
    list_filter = ('date', 'anonymous')

@admin.register(Volunteer)
class VolunteerAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'phone')
    search_fields = ('name', 'email', 'phone')
    list_filter = ('skills',)
