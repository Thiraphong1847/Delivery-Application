import 'package:flutter/material.dart';

class RiderPage extends StatelessWidget {
  const RiderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF22C569),
        title: const Text(
          "Lightning BOLT",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Rider info
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  // backgroundImage: AssetImage("assets/rider.png"),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "สมชาย จงหมายรัก",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("0912222222", style: TextStyle(color: Colors.black54)),
                  ],
                ),
                Spacer(),
                ElevatedButton(onPressed: null, child: Text("ออกจากระบบ")),
              ],
            ),
            const SizedBox(height: 20),

            // รายการงาน
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              "NEW",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text("สินค้า : Aula F75 Max 1 รายการ"),
                          const Text("พิกัดรับสินค้า : 13.756331 : 100.501762"),
                          const Text("พิกัดส่งสินค้า : 13.757000 : 100.502500"),
                          const Text("ระยะทาง : 1.2 กม."),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF22C569),
                              ),
                              child: const Text("รับงานนี้"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
