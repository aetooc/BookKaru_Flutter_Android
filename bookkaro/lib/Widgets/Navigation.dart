import 'package:bookkaro/Provider/NavigatorProvider.dart';
import 'package:bookkaro/Screens/Mybookings.dart';
import 'package:bookkaro/Screens/Profile.dart';
import 'package:bookkaro/Screens/profile-temp.dart';
import 'package:bookkaro/Screens/wallet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/Hompage.dart';

var keyCheck = 0;

class Navigation extends StatefulWidget {
  //  Navigation({Key? key}) : super(key: key);

  Navigation({var check}) {
    keyCheck = check;
  }

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  final screens =  [
    MyHomePage(),
    Bookings(),
    WalletScreen(),
    Profile(),
    // PTEMP(),
  ];
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<NavProvider>(context, listen: true);
    return Consumer<NavProvider>(
      builder: (context, val, child) {
        return Scaffold(
            body: keyCheck == 9 ? screens[0] : screens[val.index],
            bottomNavigationBar: CurvedNavigationBar(
                index: keyCheck == 9 ? val.index = 0 : val.index,
                color: Theme.of(context).colorScheme.primary,
                animationDuration: const Duration(milliseconds: 325),
                onTap: (value) {
                  val.setValue(value);
                  keyCheck = 0;
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                items: [
                  Icon(Icons.home,
                      color: Theme.of(context).colorScheme.secondary),
                  Icon(Icons.schedule,
                      color: Theme.of(context).colorScheme.secondary),
                  Icon(Icons.wallet,
                      color: Theme.of(context).colorScheme.secondary),
                  Icon(Icons.person,
                      color: Theme.of(context).colorScheme.secondary)
                ]));
      },
    );
  }
}
