import 'package:flutter/services.dart';

import '../Widgets/ListView_Home.dart';
import 'package:flutter/material.dart';
import '../Widgets/slider_try.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('BookKaru')),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade900,
                Theme.of(context).colorScheme.primary,
                Colors.white60,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              ComplicatedImageDemo(),
              const SizedBox(height: 10,),
              const ListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
