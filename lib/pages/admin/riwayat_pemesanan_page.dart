import 'package:flutter/material.dart';

class RiwayatPemesananPage extends StatelessWidget {
  const RiwayatPemesananPage({super.key});

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
                const Text(
                  "Riwayat Pemesanan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= LIST RIWAYAT =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                RiwayatCard(
                  namaMobil: "Toyota Avanza",
                  tanggal: "10 Okt 2025 – 15 Okt 2025",
                  status: "Selesai",
                  statusColor: Colors.green,
                ),
                RiwayatCard(
                  namaMobil: "Daihatsu Xenia",
                  tanggal: "16 Okt 2025 – 18 Okt 2025",
                  status: "Aktif",
                  statusColor: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= CARD RIWAYAT =================
class RiwayatCard extends StatelessWidget {
  final String namaMobil;
  final String tanggal;
  final String status;
  final Color statusColor;

  const RiwayatCard({
    super.key,
    required this.namaMobil,
    required this.tanggal,
    required this.status,
    required this.statusColor,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // INFO
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namaMobil,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                tanggal,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          // STATUS
          Text(
            status,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
