import 'package:delivery_application/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // ✅ ไว้กลับไปหน้า LoginPage

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final profileImgController = TextEditingController();

  final registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "User",
              style: TextStyle(
                color: Color(0xFF2ECC71),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // เบอร์โทร
            _buildInputField(
              "เบอร์โทร",
              "เบอร์โทร",
              controller: phoneController,
            ),
            const SizedBox(height: 15),

            // รหัสผ่าน
            _buildInputField(
              "รหัสผ่าน",
              "รหัสผ่าน",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 15),

            // ชื่อ-สกุล
            _buildInputField("ชื่อ-สกุล", "ชื่อ", controller: nameController),
            const SizedBox(height: 15),

            // อัปโหลดรูป
            _buildUploadButton(
              "รูป",
              "อัปโหลดรูป",
              controller: profileImgController,
            ),
            const SizedBox(height: 30),

            // ปุ่มสมัครสมาชิก
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () async {
                  final ok = await registerController.registerUser(
                    nameController.text.trim(),
                    phoneController.text.trim(),
                    passwordController.text.trim(),
                    profileImg: profileImgController.text.trim(),
                  );
                  if (ok) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("สมัครสมาชิกสำเร็จ ✅")),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          registerController.errorMessage ?? "สมัครไม่สำเร็จ",
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  "สมัครสมาชิก",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 🔥 ปุ่มกดกลับไปหน้า login
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                "มีบัญชีแล้ว",
                style: TextStyle(color: Color(0xFF2ECC71)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String hint, {
    bool obscureText = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2ECC71)),
        ),
      ),
    );
  }

  Widget _buildUploadButton(
    String label,
    String text, {
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(color: Colors.grey),
            ),
            onPressed: () async {
              // TODO: ถ้ามีระบบเลือกไฟล์จริง ค่อยเปลี่ยน logic
              // ตอนนี้ใช้ text field กรอก URL/ชื่อไฟล์
              if (controller != null) {
                controller.text = "user_profile.png";
              }
            },
            icon: const Icon(Icons.cloud_upload_outlined, color: Colors.grey),
            label: Text(text, style: const TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
