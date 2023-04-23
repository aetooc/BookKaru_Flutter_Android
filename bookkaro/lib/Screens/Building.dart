import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Building extends StatelessWidget {
  const Building({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Coming Soon')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://1.bp.blogspot.com/-F4Qt-dyV9hM/X8ij-MTGrzI/AAAAAAAAAPQ/8T2qqnR9TfQcMSQIiQnAVskjK3erDWT4QCLcBGAsYHQ/s425/a2.jpg',
              fit: BoxFit.cover),
        ],
      ),
    );
  }
}
