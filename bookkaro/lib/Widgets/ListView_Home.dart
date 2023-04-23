import 'package:bookkaro/Widgets/Slide_Picture.dart';
import 'package:flutter/material.dart';
import './ListView_Icons.dart';
import './ListView_Slides.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

final List<String> imagesList = [
  './assets/images/image_0.png',
  './assets/images/image_1.png',
  './assets/images/image_2.png',
  './assets/images/image_3.png',
  './assets/images/image_4.png',
];

List<String> imageAdd = [
  './assets/images/image_5.png',
  './assets/images/image_6.png',
  './assets/images/image_7.png',
];

List<String> imagesList2 = [
  './assets/images/image_8.png',
  './assets/images/image_9.png',
  './assets/images/image_10.png',
  './assets/images/image_11.png',
  './assets/images/image_12.png',
];

class _ListWidgetState extends State<ListWidget> {
  List<Widget> wid = [
    HomeCard(),
    SlidesClass('Bus', imagesList),
    Slides('Car', imageAdd[0]),
    Slides('Cricket', imageAdd[1]),
    Slides('Events', imageAdd[2]),
    SlidesClass('Blog', imagesList2),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // margin: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.all(15),
        // margin: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return wid[index];
          },
        ),
      ),
    );
  }
}
