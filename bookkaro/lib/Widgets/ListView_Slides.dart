import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidesClass extends StatelessWidget {
  final List<String> imagesList;
  final String data;

  SlidesClass(this.data, this.imagesList);

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              data,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primaryVariant),
            ),
          ],
        ),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.8,
            autoPlay: false,
            enlargeCenterPage: true,
          ),
          items: imagesList
              .map(
                (item) => Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
