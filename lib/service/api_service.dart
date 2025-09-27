import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.88.243:3000";
  // ❗ ถ้าใช้ emulator Android → "http://10.0.2.2:3000"
  // ❗ ถ้าใช้ device จริง → เปลี่ยนเป็น IP เครื่อง PC เช่น "http://192.168.1.xx:3000"

  /* ==========================================================
     USER API
     ========================================================== */

  // ---------------- USER REGISTER ----------------
  static Future<Map<String, dynamic>> userRegister(
    String name,
    String phone,
    String password, {
    String? profileImg,
  }) async {
    final url = Uri.parse("$baseUrl/user/register");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "password": password,
        "profile_img": profileImg ?? "",
      }),
    );
    return jsonDecode(response.body);
  }

  // ---------------- USER LOGIN ----------------
  static Future<Map<String, dynamic>> userLogin(
    String phone,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/user/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "password": password}),
    );
    return jsonDecode(response.body);
  }

  /* ==========================================================
     RIDER API
     ========================================================== */

  // ---------------- RIDER REGISTER ----------------
  static Future<Map<String, dynamic>> riderRegister(
    String name,
    String phone,
    String password, {
    String? profileImg,
    String? vehiclePlate,
    String? vehicleImage,
  }) async {
    final url = Uri.parse("$baseUrl/rider/register");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "password": password,
        "profile_img": profileImg ?? "",
        "vehicle_plate": vehiclePlate ?? "",
        "vehicle_image": vehicleImage ?? "",
      }),
    );
    return jsonDecode(response.body);
  }

  // ---------------- RIDER LOGIN ----------------
  static Future<Map<String, dynamic>> riderLogin(
    String phone,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/rider/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "password": password}),
    );
    return jsonDecode(response.body);
  }
}
