from django.db import models

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
