import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/login/screens/screens.dart';
import 'package:flutter_application_1/providers/Auth.dart';
import 'package:flutter_application_1/providers/destination.dart';
import 'package:flutter_application_1/screens/wrapper.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Destination()),
          ChangeNotifierProvider(create: (context) => AuthService()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            '/': (context) => wrapper(),
            '/Login': (context) => LoginScreen(),
            '/Register':(context) => SignUpScreen()
          },
        ));
  }
}
