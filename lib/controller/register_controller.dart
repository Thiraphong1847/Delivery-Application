import 'package:delivery_application/service/api_service.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  // ---------------- USER REGISTER ----------------
  Future<bool> registerUser(
    String name,
    String phone,
    String password, {
    String? profileImg,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await ApiService.userRegister(
        name,
        phone,
        password,
        profileImg: profileImg,
      );

      isLoading = false;
      notifyListeners();

      if (res['status'] == 'success') {
        return true;
      } else {
        errorMessage = res['message'];
        return false;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = "เกิดข้อผิดพลาด: $e";
      notifyListeners();
      return false;
    }
  }

  // ---------------- RIDER REGISTER ----------------
  Future<bool> registerRider(
    String name,
    String phone,
    String password, {
    String? profileImg,
    String? vehiclePlate,
    String? vehicleImage,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await ApiService.riderRegister(
        name,
        phone,
        password,
        profileImg: profileImg,
        vehiclePlate: vehiclePlate,
        vehicleImage: vehicleImage,
      );

      isLoading = false;
      notifyListeners();

      if (res['status'] == 'success') {
        return true;
      } else {
        errorMessage = res['message'];
        return false;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = "เกิดข้อผิดพลาด: $e";
      notifyListeners();
      return false;
    }
  }
}
