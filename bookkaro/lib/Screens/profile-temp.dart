import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class PTEMP extends StatelessWidget {
// Fetch the data from Firestore once
  Future<String> fetchName() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var document = await FirebaseFirestore.instance
        .collection('UserData')
        .doc(userId)
        .get();
    return document.data()!['name'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          FutureBuilder(
            future: fetchName(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ProfileMenu(
                  text: snapshot.data as String,
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                );
              } else {
                return ProfileMenu(
                  text: 'Loading...',
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                );
              }
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
