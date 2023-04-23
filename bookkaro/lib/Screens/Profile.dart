import 'package:bookkaro/Screens/auth/login_screen.dart';
import 'package:bookkaro/Screens/profile_menu.dart';
import 'package:bookkaro/Screens/profile_pic.dart';
import 'package:bookkaro/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('UserData');
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Center(child: Text('BookKaru')),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('UserData')
                .where('userId',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();

              if (snapshot.hasError) return const Text('Some error');

              if (snapshot.data!.docs.isNotEmpty) {
                // return Text(snapshot.data!.docs[0]['name'].toString());
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: Column(
                    children: [
                      const ProfilePic(),
                      const SizedBox(height: 20),
                      ProfileMenu(
                        text: snapshot.data!.docs[0]['name'].toString(),
                        icon: "assets/icons/User Icon.svg",
                        press: () {},
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
                        press: () {
                          _auth.signOut().then((value) {
                            Navigator.pushReplacementNamed(context, '/login');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginScreen())).onError(
                                (error, stackTrace) =>
                                    Utils().toastMessage(error.toString()));
                          });
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const Text('No data found');
              }
            },
          ),
        ],
      ),
    );
  }
}
