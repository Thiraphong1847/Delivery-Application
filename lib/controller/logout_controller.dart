// import 'package:delivery_application/service/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:midterm/login.dart';

// class LogoutController {
//   final FlutterSecureStorage storage = FlutterSecureStorage();

//   Future<void> logout(BuildContext context) async {
//     // ล้าง accessToken และ refreshToken
//     await storage.delete(key: "accessToken");
//     await storage.delete(key: "refreshToken");

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//       (Route<dynamic> route) => false,
//     );
//   }
// }
