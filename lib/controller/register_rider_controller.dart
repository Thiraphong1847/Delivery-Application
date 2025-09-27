// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:delivery_application/service/api_service.dart';
// import 'package:midterm/models/md_respone.dart';

// class RiderRegisterController extends ChangeNotifier {
//   bool _showPassword = false;
//   bool get showPassword => _showPassword;

//   late BuildContext _context;

//   TextEditingController phoneController = TextEditingController(text: "");
//   TextEditingController passwordController = TextEditingController(text: "");
//   TextEditingController nameController = TextEditingController(text: "");
//   TextEditingController vehiclePlateController = TextEditingController(text: "");

//   File? profileImage;
//   File? vehicleImage;

//   ApiService apiService = ApiService();

//   void toggleShowPassword() {
//     _showPassword = !_showPassword;
//     notifyListeners();
//   }

//   void setContext(BuildContext context) {
//     _context = context;
//   }

//   void setProfileImage(File image) {
//     profileImage = image;
//     notifyListeners();
//   }

//   void setVehicleImage(File image) {
//     vehicleImage = image;
//     notifyListeners();
//   }

//   Future<void> registerRider() async {
//     if (phoneController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         nameController.text.isEmpty ||
//         vehiclePlateController.text.isEmpty) {
//       _showDialog("กรุณากรอกข้อมูลให้ครบถ้วน", isError: true);
//       return;
//     }

//     try {
//       final data = {
//         "phone": phoneController.text,
//         "password": passwordController.text,
//         "name": nameController.text,
//         "vehicle_plate": vehiclePlateController.text,
//         // สำหรับรูปภาพ ถ้า backend รับ base64 ให้แปลงตรงนี้
//         // "profile_image": profileImageBase64,
//         // "vehicle_image": vehicleImageBase64,
//       };

//       final response = await apiService.postRequest("/rider/register", data, token: '');
//       MdRespone resp = MdRespone.fromJson(response);

//       if (resp.status == "success") {
//         _showDialog(resp.message, isError: false);
//       } else {
//         _showDialog(resp.message, isError: true);
//       }
//     } catch (e) {
//       _showDialog("เกิดข้อผิดพลาด: $e", isError: true);
//     }
//   }

//   void _showDialog(String message, {bool isError = false}) {
//     showDialog(
//       context: _context,
//       builder: (context) => AlertDialog(
//         title: Row(
//           children: [
//             Icon(Icons.info, color: isError ? Colors.red : Colors.green),
//             const SizedBox(width: 8),
//             Text(
//               isError ? "ผิดพลาด" : "สำเร็จ",
//               style: TextStyle(color: isError ? Colors.red : Colors.green),
//             ),
//           ],
//         ),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }
// }
