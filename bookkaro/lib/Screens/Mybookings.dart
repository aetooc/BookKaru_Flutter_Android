import 'package:bookkaro/Widgets/BookingCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ComingSoon.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('BookKaru')),
      ),
      body: ListView(children: const [
      BookingCard(),
                // Text('Hello')
    ]),
      // body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     Text('My Bookings'),
          //   ],
          // )
          
        // ],
      // ),
    );
  }
}
