import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<String> imageUrls;

  CarouselSliderWidget({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.network(url, fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageUrls.map((url) {
            int index = imageUrls.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
