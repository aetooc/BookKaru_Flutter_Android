import 'package:flutter/material.dart';

class Slides extends StatelessWidget {
  final String data;
  final String imageAdd;

  Slides(this.data, this.imageAdd);
  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 10,),
        Container(
          width: 350,
          child: Image.asset(
            imageAdd,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
