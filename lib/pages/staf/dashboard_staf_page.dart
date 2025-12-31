import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../models/user_model.dart';
import 'package:project_rental_mobil/pages/staf/lapor_kondisi_page.dart';
import 'lapor_status_page.dart';
import 'Konf_page.dart';

// ======================= MODEL & DATA TIRUAN =======================

class PengecekanMobil {
  final String namaMobil;
  final String nomorPolisi;
  final String namaPenyewa;
  final String status;
  final String imageUrl;

  PengecekanMobil({
    required this.namaMobil,
    required this.nomorPolisi,
    required this.namaPenyewa,
    required this.status,
    required this.imageUrl,
  });
}

// Data tiruan (bisa disesuaikan / ganti dengan API nantinya)
final List<PengecekanMobil> mockMobilStaf = [
  PengecekanMobil(
    namaMobil: "AVANZA",
    nomorPolisi: "B 1234 XY",
    namaPenyewa: "Rangga Saputra",
    status: "Sedang Dipakai",
    imageUrl: 'assets/image/Avanza1.jpg',
  ),
  PengecekanMobil(
    namaMobil: "AVANZA",
    nomorPolisi: "D 5678 ZI",
    namaPenyewa: "Siti Rahmawati",
    status: "Sedang Dipakai",
    imageUrl: 'assets/image/Avanza1.jpg',
  ),
  PengecekanMobil(
    namaMobil: "AVANZA",
    nomorPolisi: "B 9012 AA",
    namaPenyewa: "Andi Wijaya",
    status: "Sedang Dipakai",
    imageUrl: 'assets/image/Avanza1.jpg',
  ),
  PengecekanMobil(
    namaMobil: "AVANZA",
    nomorPolisi: "B 3456 BC",
    namaPenyewa: "Budi Santoso",
    status: "Sedang Dipakai",
    imageUrl: 'assets/image/Avanza1.jpg',
  ),
];

// ======================= DASHBOARD STAF PAGE =======================

class DashboardStafPage extends StatefulWidget {
  final UserModel user;

  const DashboardStafPage({super.key, required this.user});

  @override
  State<DashboardStafPage> createState() => _DashboardStafPageState();
}

class _DashboardStafPageState extends State<DashboardStafPage> {
  final TextEditingController _searchController = TextEditingController();
  List<PengecekanMobil> _filteredList = List.from(mockMobilStaf);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredList = mockMobilStaf.where((item) {
        return item.namaMobil.toLowerCase().contains(query) ||
            item.nomorPolisi.toLowerCase().contains(query) ||
            item.namaPenyewa.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderAndMenu(),
            _buildBodyList(),
          ],
        ),
      ),
    );
  }

  // ======================= HEADER & KOTAK AKSI =======================

  Widget _buildHeaderAndMenu() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bar atas: icon menu + teks selamat datang
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.menu, color: AppColors.textWhite, size: 30),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "Selamat Datang, ${widget.user.username}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Kotak oranye (Konfirmasi Kembali & Lapor Status)
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.accent, // oranye
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildActionRow(
                    icon: Icons.assignment_turned_in_outlined,
                    title: "Konfirmasi Kembali",
                    buttonText: "Konfirmasi",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const KonfPage(),
                        ),
                      );
                    },

                  ),
                  const SizedBox(height: 16),
                  _buildActionRow(
                    icon: Icons.assignment_late_outlined,
                    title: "Lapor Status",
                    buttonText: "Lapor",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LaporStatusPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow({
    required IconData icon,
    required String title,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        // Icon di dalam kotak putih
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 30,
          ),
        ),
        const SizedBox(width: 12),
        // Judul teks
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        // Tombol di sisi kanan
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.statusDark,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildBodyList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Periksa Kondisi Mobil Dengan Teliti !!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 15),

          // Search field
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Cari Mobil",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: AppColors.textWhite,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // List mobil
          ..._filteredList.map((item) => _buildMobilCard(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildMobilCard(PengecekanMobil data) {
    final bool isDark = _filteredList.indexOf(data) % 2 == 0;
    final Color bgColor = isDark ? AppColors.statusDark : AppColors.statusLight;
    final Color textColor = isDark ? AppColors.textWhite : AppColors.textDark;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama mobil
          Text(
            data.namaMobil,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar mobil
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  data.imageUrl,
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),

              // Detail + tombol laporkan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow("Nomor Polisi :", data.nomorPolisi, textColor),
                    _buildDetailRow("Nama Penyewa :", data.namaPenyewa, textColor),
                    _buildDetailRow("Status :", data.status, textColor),
                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LaporKondisiPage(),
                            ),
                          );
                        },


                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8A50), // oranye tombol
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Laporkan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 13, color: color),
          children: <TextSpan>[
            TextSpan(
                text: label,
                style: const TextStyle(fontWeight: FontWeight.w500)),
            TextSpan(text: ' $value'),
          ],
        ),
      ),
    );
  }
}
