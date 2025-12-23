import 'package:flutter/material.dart';

class TambahMobilPage extends StatelessWidget {
  const TambahMobilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F6),
      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF5C8DA3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Text(
                    "Tambah Mobil",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ================= FORM =================
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Nama Mobil"),
                  _textField(),

                  const SizedBox(height: 14),
                  _label("Nomor Polisi"),
                  _textField(),

                  const SizedBox(height: 14),
                  _label("Kapasitas"),
                  _textField(
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 14),
                  _label("Tahun"),
                  _textField(
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 14),
                  _label("Harga Sewa"),
                  _textField(
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 14),
                  _label("Deskripsi"),
                  _textField(maxLines: 3),

                  const SizedBox(height: 32),

                  // ================= BUTTON =================
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: proses tambah mobil
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5A7E8C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Tambah",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= WIDGET BANTU =================
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _textField({
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
