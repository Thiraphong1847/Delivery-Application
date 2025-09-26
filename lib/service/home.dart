import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF22C569),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Lightning BOLT", style: TextStyle(color: Colors.white)),
            Row(
              children: const [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/profile.png"),
                ),
                SizedBox(width: 8),
                Text("0811111111", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ช่องค้นหา
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "ค้นหาพัสดุ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ปุ่มฟังก์ชัน
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _menuBox(Icons.local_shipping, "ส่งพัสดุ"),
                _menuBox(Icons.track_changes, "สถานะพัสดุ"),
              ],
            ),
            const SizedBox(height: 20),
            _menuBox(Icons.inventory, "พัสดุของฉัน", big: true),
          ],
        ),
      ),

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

  Widget _menuBox(IconData icon, String text, {bool big = false}) {
    return Container(
      width: big ? 200 : 140,
      height: big ? 80 : 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF22C569), size: 40),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
