from djongo import models

# Create your models here.
class Cinema(models.Model):
    id=models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=50)
    owner=models.CharField(max_length=50)
    
    def __str__(self):
        return self.name

class Movie(models.Model):
    CATEGORIES = (
        ('ACTION', 'action'),
        ('COMEDY', 'comedy'),
        ('DRAMA', 'drama'),
        ('FANTASY', 'fantasy'),
        ('HORROR', 'horror'),
        ('MYSTERY', 'mystery'),
        ('ROMANCE', 'romance'),
        ('THRILLER', 'thriller'),
    )
    id=models.BigAutoField(primary_key=True)
    title = models.CharField(max_length=50,blank=False)
    start_date=models.DateField(blank=False)
    end_date=models.DateField(blank=False)
    cinema_name=models.ForeignKey(
        Cinema, on_delete=models.CASCADE,blank=False
    )
    category=models.CharField(max_length=50,choices=CATEGORIES,blank=False)

    def __str__(self):
        return self.title + '-' + str(self.cinema_name)

    class Meta:
        ordering = ['-end_date']

class Favorites(models.Model):
    id=models.BigAutoField(primary_key=True)
    userID=models.CharField(max_length=150,blank=False)
    movieID=models.CharField(max_length=150,blank=False)

    class Meta:
        verbose_name_plural = 'Favorites'