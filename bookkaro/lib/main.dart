import 'package:bookkaro/Provider/GoogleSignInProvider.dart';
import 'package:bookkaro/Provider/NavigatorProvider.dart';
import 'package:bookkaro/Screens/Hompage.dart';
import 'package:bookkaro/Screens/splash_screen.dart';
import 'package:bookkaro/Widgets/Navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => NavProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => GoogleSignInProvider()),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/login': (context) => Navigation(check: 9),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: Colors.white)),
        home: const SplashScreen(),
      ),
    );
  }
}
