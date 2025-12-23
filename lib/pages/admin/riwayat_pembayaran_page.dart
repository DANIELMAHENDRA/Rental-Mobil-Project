import 'package:flutter/material.dart';

class RiwayatPembayaranPage extends StatelessWidget {
  const RiwayatPembayaranPage({super.key});

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
                  "Verifikasi Pembayaran",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ================= SEARCH BAR =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Nama Pengirim",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ================= LIST =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _paymentCard(isValid: false),
                _paymentCard(isValid: true),
                _paymentCard(isValid: true),
                _paymentCard(isValid: true),
                _paymentCard(isValid: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= CARD ITEM =================
  Widget _paymentCard({required bool isValid}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // ================= TITLE & STATUS =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Penyewa",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              _statusBadge(isValid),
            ],
          ),

          const SizedBox(height: 8),

          // ================= DETAIL =================
          const Text("Nama : Budi Santoso"),
          const SizedBox(height: 4),
          const Text("Tanggal Menyewa: 10 – 12 Oktober 2025"),
          const SizedBox(height: 4),
          const Text("Harga: Rp. 1.050.000"),

          const SizedBox(height: 12),

          // ================= BUTTON =================
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigator ke detail / verifikasi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8A50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              child: const Text(
                "Verify",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= STATUS BADGE =================
  Widget _statusBadge(bool isValid) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isValid
            ? const Color(0xFFDFF7C8)
            : const Color(0xFFE6F0F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isValid ? "Valid" : "No Valid",
        style: TextStyle(
          color: isValid ? Colors.green : Colors.black87,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
