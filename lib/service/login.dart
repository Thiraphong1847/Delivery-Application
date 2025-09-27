import 'package:delivery_application/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'register_user.dart';
import 'register_rider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // โลโก้ข้อความ Lightning BOLT
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(
                        text: "Lightning ",
                        style: TextStyle(color: Color(0xFFEFDC35)),
                      ),
                      TextSpan(
                        text: "BOLT",
                        style: TextStyle(color: Color(0xFF22C569)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),

                // ช่องเบอร์โทร
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 5),
                      child: Text(
                        'เบอร์โทร',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF22C569),
                        ),
                      ),
                    ),
                    TextField(
                      controller: phoneController, // ✅ bind controller
                      decoration: InputDecoration(
                        hintText: "กรอกเบอร์โทร",
                        hintStyle: const TextStyle(color: Color(0xFF2E7D32)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ช่องรหัสผ่าน
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 5),
                      child: Text(
                        'รหัสผ่าน',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: (Color(0xFF22C569)),
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController, // ✅ bind controller
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรอกรหัสผ่าน",
                        hintStyle: const TextStyle(color: Color(0xFF2E7D32)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 43),

                // ปุ่มเข้าสู่ระบบ
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2ECC71),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      final phone = phoneController.text.trim();
                      final pass = passwordController.text.trim();

                      if (phone.isEmpty || pass.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("กรุณากรอกข้อมูลให้ครบ"),
                          ),
                        );
                        return;
                      }

                      // ✅ เรียกใช้งาน controller login user
                      final result = await loginController.loginUser(
                        phone,
                        pass,
                      );

                      if (result != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("เข้าสู่ระบบสำเร็จ ✅")),
                        );
                        print(result); // ✅ แสดง token + ข้อมูล user
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              loginController.errorMessage ??
                                  "เข้าสู่ระบบล้มเหลว",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "เข้าสู่ระบบ",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ลิงก์สมัครสมาชิก
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterUserPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "สมัครสมาชิกทั่วไป",
                        style: TextStyle(color: Color(0xFF2E7D32)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterRiderPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "สมัครสมาชิกไรเดอร์",
                        style: TextStyle(color: Color(0xFF2E7D32)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
