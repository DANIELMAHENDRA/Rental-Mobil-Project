import 'package:flutter/material.dart';
import 'edit_pelanggan_page.dart';



class DatailPelangganPage extends StatelessWidget {
  const DatailPelangganPage({super.key});

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
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Mengelola Data\nPelanggan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // TODO: fitur search
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= LIST DATA =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                _PelangganCard(
                  nama: "Budi Santoso",
                  email: "budi.s@email.com",
                  telepon: "08123456789",
                ),
                _PelangganCard(
                  nama: "Citra Lestari",
                  email: "citra.l@email.com",
                  telepon: "08987654321",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= CARD PELANGGAN =================
class _PelangganCard extends StatelessWidget {
  final String nama;
  final String email;
  final String telepon;

  const _PelangganCard({
    required this.nama,
    required this.email,
    required this.telepon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====== NAMA & EDIT ======
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditPelangganPage(),
                    ),
                  );
                },
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ====== DETAIL ======
          Text(
            email,
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text(
            telepon,
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
