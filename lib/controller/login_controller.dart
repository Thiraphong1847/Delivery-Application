import 'package:delivery_application/service/api_service.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  // ---------------- USER LOGIN ----------------
  Future<Map<String, dynamic>?> loginUser(String phone, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await ApiService.userLogin(phone, password);

      isLoading = false;
      notifyListeners();

      if (res['status'] == 'success') {
        return res['data']; // ✅ คืนข้อมูล user เช่น token, name
      } else {
        errorMessage = res['message'];
        return null;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = "เกิดข้อผิดพลาด: $e";
      notifyListeners();
      return null;
    }
  }

  // ---------------- RIDER LOGIN ----------------
  Future<Map<String, dynamic>?> loginRider(
    String phone,
    String password,
  ) async {
    try {
      isLoading = true;
      notifyListeners();

      final res = await ApiService.riderLogin(phone, password);

      isLoading = false;
      notifyListeners();

      if (res['status'] == 'success') {
        return res['data']; // ✅ คืนข้อมูล rider เช่น token, vehicle
      } else {
        errorMessage = res['message'];
        return null;
      }
    } catch (e) {
      isLoading = false;
      errorMessage = "เกิดข้อผิดพลาด: $e";
      notifyListeners();
      return null;
    }
  }
}
