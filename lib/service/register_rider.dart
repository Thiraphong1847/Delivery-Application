import 'package:delivery_application/service/login.dart';
import 'package:flutter/material.dart';

class RegisterRiderPage extends StatelessWidget {
  const RegisterRiderPage({super.key});

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
              "Rider",
              style: TextStyle(
                color: Color(0xFF2ECC71),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            _buildInputField("เบอร์โทร", "เบอร์โทร"),
            const SizedBox(height: 15),

            _buildInputField("รหัสผ่าน", "รหัสผ่าน", obscureText: true),
            const SizedBox(height: 15),

            _buildInputField("ชื่อ-สกุล", "ชื่อ"),
            const SizedBox(height: 15),

            _buildUploadButton("รูปโปรไฟล์", "รูปภาพตนเอง"),
            const SizedBox(height: 15),

            _buildUploadButton("รูปยานพาหนะ", "รูปยานพาหนะ"),
            const SizedBox(height: 15),

            _buildInputField("ทะเบียนรถ", "ทะเบียนรถ"),
            const SizedBox(height: 30),

            // ปุ่มสมัคร
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
                onPressed: () {},
                child: const Text(
                  "สมัคร",
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
  }) {
    return TextField(
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

  Widget _buildUploadButton(String label, String text) {
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
            onPressed: () {
              // TODO: เพิ่มฟังก์ชันเลือกไฟล์
            },
            icon: const Icon(Icons.cloud_upload_outlined, color: Colors.grey),
            label: Text(text, style: const TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
