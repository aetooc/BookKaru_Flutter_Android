import 'package:bookkaro/Provider/GoogleSignInProvider.dart';
import 'package:bookkaro/Screens/auth/login_screen.dart';
import 'package:bookkaro/Widgets/Round_button.dart';
import 'package:bookkaro/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('UserData');

  FirebaseAuth _auth = FirebaseAuth.instance;

  void firebaseLoginFun(String? userId) {
    if (FirebaseAuth.instance.currentUser != null) {
      fireStore
          .doc(userId)
          .set({
            'userId': userId,
            'name': nameController.text.toString(),
            'email': emailController.text.toString(),
          })
          .then((value) => Utils().toastMessage('Data added to Firestore'))
          .onError((error, stackTrace) {
            Utils().toastMessage(error.toString());
          });
    } else {
      debugPrint('Ja be Ja ${FirebaseAuth.instance.currentUser}');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void signUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      String userId = value.user!.uid;
      firebaseLoginFun(userId);
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils()
          .toastMessage(error.toString().replaceRange(0, 14, '').split(']')[1]);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sign Up')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.badge_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      Icons.alternate_email,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ]),
            ),
            RoundButton(
              title: 'Sign Up',
              loading: loading,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  signUp();
                }
                // String id = DateTime.now().microsecondsSinceEpoch.toString();
                // String userId;
                // if (FirebaseAuth.instance.currentUser != null) {
                //   userId = FirebaseAuth.instance.currentUser!.uid;
                //   debugPrint('hi $userId');
                //   fireStore
                //       .doc(userId)
                //       .set({
                //         'userId': userId,
                //         'name': nameController.text.toString(),
                //         'email': emailController.text.toString(),
                //       })
                //       .then((value) =>
                //           Utils().toastMessage('Data added to Firestore'))
                //       .onError((error, stackTrace) {
                //         Utils().toastMessage(error.toString());
                //       });
                // } else {
                //   debugPrint('Ja be Ja ${FirebaseAuth.instance.currentUser}');
                // }
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('Or SignUp with'),
            //     IconButton(
            //       icon: const Icon(
            //         FontAwesomeIcons.google,
            //         color: Colors.red,
            //         size: 25.0,
            //       ),
            //       onPressed: () {
            //         final provider = Provider.of<GoogleSignInProvider>(context,
            //             listen: false);
            //         provider.googleLogin(context);
            //         // SignUp();
            //       },
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text('Login'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
