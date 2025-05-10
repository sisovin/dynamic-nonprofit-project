import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../models/testimonial.dart';

class TestimonialPage extends StatelessWidget {
  final List<Testimonial> testimonials = [
    Testimonial(
      author: 'John Doe',
      role: 'Donor',
      content: 'This nonprofit has changed my life!',
      image: 'assets/images/john_doe.jpg',
      rating: 5,
    ),
    Testimonial(
      author: 'Jane Smith',
      role: 'Volunteer',
      content: 'I love working with this organization!',
      image: 'assets/images/jane_smith.jpg',
      rating: 4,
    ),
    // Add more testimonials here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testimonials'),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return TestimonialCard(testimonial: testimonials[index]);
        },
        itemCount: testimonials.length,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(testimonial.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              testimonial.author,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              testimonial.role,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(testimonial.content),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < testimonial.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
