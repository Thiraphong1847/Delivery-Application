import 'package:delivery_application/service/home.dart';
import 'package:delivery_application/service/login.dart';
import 'package:delivery_application/service/profile.dart';
import 'package:delivery_application/service/register_rider.dart';
import 'package:delivery_application/service/register_user.dart';
import 'package:delivery_application/service/rider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const LoginPage(),
      // home: const RegisterUserPage(),
      // home: const RegisterRiderPage(),
      // home: const ProfilePage(),
      // home: const HomePage(),
      // home: const RiderPage(),
    );
  }
}
