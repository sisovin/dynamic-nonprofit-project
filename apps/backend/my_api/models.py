from django.db import models
from django.contrib.postgres.fields import JSONField

class Nonprofit(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    website = models.URLField()

    def __str__(self):
        return self.name

class Project(models.Model):
    nonprofit = models.ForeignKey(Nonprofit, on_delete=models.CASCADE)
    title = models.CharField(max_length=255)
    description = models.TextField()
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return self.title

class Campaign(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    image = models.ImageField(upload_to='campaign_images/')
    target_amount = models.DecimalField(max_digits=10, decimal_places=2)
    raised_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    start_date = models.DateField()
    end_date = models.DateField()
    is_featured = models.BooleanField(default=False)

    def __str__(self):
        return self.title

class TeamMember(models.Model):
    name = models.CharField(max_length=255)
    position = models.CharField(max_length=255)
    bio = models.TextField()
    image = models.ImageField(upload_to='team_images/')
    social_links = JSONField()

    def __str__(self):
        return self.name

class Testimonial(models.Model):
    author = models.CharField(max_length=255)
    role = models.CharField(max_length=255)
    content = models.TextField()
    image = models.ImageField(upload_to='testimonial_images/')
    rating = models.IntegerField()

    def __str__(self):
        return self.author

class Donation(models.Model):
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    donor = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    campaign = models.ForeignKey(Campaign, on_delete=models.CASCADE)
    date = models.DateField(auto_now_add=True)
    anonymous = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.amount} - {self.donor}"

class Volunteer(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    skills = models.TextField()
    availability = models.TextField()

    def __str__(self):
        return self.name
