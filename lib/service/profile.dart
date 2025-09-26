import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF8),
      appBar: AppBar(
        title: const Text("โปรไฟล์", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF22C569),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Avatar
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              "assets/profile.png",
            ), // เปลี่ยนตามไฟล์รูป
          ),
          const SizedBox(height: 15),

          // ชื่อและเบอร์
          const Text(
            "น้องบอส ชอบกินปั้นต์",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "0811111111",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 10),

          // ปุ่มแก้ไข
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 18),
            label: const Text("แก้ไข"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF22C569),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ปุ่มจัดการที่อยู่
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: "จัดการที่อยู่",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // ปุ่มออกจากระบบ
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // กลับไปหน้าเดิม (HomePage)
                // ถ้ามีหน้า Login ก็เปลี่ยนเป็น pushReplacement ไปหน้า Login ได้
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF22C569),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "ออกจากระบบ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),

      // Bottom Nav
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF22C569),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าหลัก"),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "พัสดุ"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: "ส่งพัสดุ",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "รายการ"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "โปรไฟล์"),
        ],
      ),
    );
  }
}
