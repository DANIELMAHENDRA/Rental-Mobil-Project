import 'package:flutter/material.dart';

class DetailRiwayatPemesananPage extends StatelessWidget {
  final Map<String, dynamic> bookingData;

  const DetailRiwayatPemesananPage({
    super.key,
    required this.bookingData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0EDF4),
      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF4E7C96),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Penilaian Rental",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ================= CONTENT =================
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // ================= PENILAIAN =================
                  _penilaianPenyewa(),

                  const SizedBox(height: 16),

                  // ================= DETAIL PEMESANAN =================
                  _detailPemesanan(),

                  const SizedBox(height: 16),

                  // ================= INFORMASI PENYEWA =================
                  _infoPenyewa(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ====================================================
  // PENILAIAN PENYEWA
  // ====================================================
  Widget _penilaianPenyewa() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Penilaian Penyewa",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E7C96),
            ),
          ),
          const SizedBox(height: 16),

          // User
          Row(
            children: const [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF4E7C96),
                child: Icon(Icons.person, color: Colors.white),
              ),
              SizedBox(width: 12),
              Text(
                "Cahyaaa7",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Rating
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber),
            ),
          ),

          const SizedBox(height: 16),

          _reviewItem("Mesin", "Bagus"),
          _reviewItem("Kenyamanan", "Nyaman untuk perjalanan jauh"),
          _reviewItem("Warna", "Sesuai dengan foto"),

          const SizedBox(height: 16),

          Text(
            bookingData["tanggal"] ?? "-",
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),

          const SizedBox(height: 16),

          // Foto Mobil
          Row(
            children: [
              Expanded(child: _buildImage(bookingData["assets/image/Avanza.jpg"])),
              const SizedBox(width: 12),
              Expanded(child: _buildImage(bookingData["assets/image/Avanza.jpg"])),
            ],
          ),

          const SizedBox(height: 16),

          // Booking Info
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    bookingData["assets/image/Avanza.jpg"] ?? "assets/image/Avanza.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, err, st) {
                      return _imageFallback(50);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Booking ${bookingData["mobil"] ?? "Mobil"}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ====================================================
  // DETAIL PEMESANAN
  // ====================================================
  Widget _detailPemesanan() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Detail Pemesanan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E7C96),
            ),
          ),
          const SizedBox(height: 16),

          _detailRow("Booking ID", bookingData["booking"] ?? "-"),
          _detailRow("Tanggal Booking", bookingData["tanggal"] ?? "-"),
          _detailRow("Mobil", bookingData["mobil"] ?? "-"),
          _detailRow("Periode Sewa", bookingData["rent"] ?? "-"),
          _detailRow(
            "Total Harga",
            bookingData["harga"] ?? "-",
            isBold: true,
          ),
          _detailRow(
            "Status",
            bookingData["status"] ?? "-",
            isBold: true,
            color: _getStatusColor(bookingData["status"]),
          ),
        ],
      ),
    );
  }

  // ====================================================
  // INFO PENYEWA
  // ====================================================
  Widget _infoPenyewa() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Informasi Penyewa",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E7C96),
            ),
          ),
          SizedBox(height: 16),
          _StaticRow("Nama", "Cahyaaa7"),
          _StaticRow("No. Telepon", "08123456789"),
          _StaticRow("Email", "cahya@example.com"),
          _StaticRow("Alamat", "Jl. Contoh No.123, Jakarta"),
        ],
      ),
    );
  }

  // ====================================================
  // HELPER
  // ====================================================
  Widget _reviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text("$label:")),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _detailRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(label)),
          const Text(": "),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: color ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl ?? "",
        height: 80,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, err, st) => _imageFallback(80),
      ),
    );
  }

  Widget _imageFallback(double size) {
    return Container(
      height: size,
      width: size,
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: const Icon(Icons.directions_car, color: Colors.grey),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Selesai":
        return Colors.green;
      case "Dibatalkan":
        return Colors.red;
      case "Aktif":
        return Colors.teal;
      default:
        return Colors.black;
    }
  }
}

// ====================================================
// STATIC ROW
// ====================================================
class _StaticRow extends StatelessWidget {
  final String label;
  final String value;

  const _StaticRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(label)),
          const Text(": "),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
