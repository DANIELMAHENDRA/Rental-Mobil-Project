import 'package:flutter/material.dart';
import 'kelola_mobil_page.dart';

class EditMobilPage extends StatefulWidget {
  const EditMobilPage({super.key});

  @override
  State<EditMobilPage> createState() => _EditMobilPageState();
}

class _EditMobilPageState extends State<EditMobilPage> {
  final TextEditingController namaMobilController =
      TextEditingController(text: "Toyota Avanza");
  final TextEditingController nomorPolisiController =
      TextEditingController(text: "B 1234 ABC");

  String statusMobil = "Tersedia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B7F95),
        elevation: 0,
        title: const Text(
          "Edit Mobil",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // aksi tambah (opsional)
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label("Nama Mobil"),
            _textField(controller: namaMobilController),

            const SizedBox(height: 16),

            _label("Nomor Polisi"),
            _textField(controller: nomorPolisiController),

            const SizedBox(height: 16),

            _label("Status"),
            _dropdown(),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KelolaMobilPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B7F95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _textField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: statusMobil,
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: "Tersedia",
              child: Text("Tersedia"),
            ),
            DropdownMenuItem(
              value: "Disewa",
              child: Text("Disewa"),
            ),
            DropdownMenuItem(
              value: "Perawatan",
              child: Text("Perawatan"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              statusMobil = value!;
            });
          },
        ),
      ),
    );
  }
}
