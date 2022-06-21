import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportMainController extends GetxController {
  var currentStep = 0.obs;

  final c = TextEditingController();
  
  var selectedImagePath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(
        source: imageSource,
        imageQuality: 100,
        maxWidth: 750,
        maxHeight: 750,
        preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar(
        'error',
        'Tidak ada gambar dipilih',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final List<Map<String, dynamic>> allKategori = [
    {
      "name": "Administrasi Kependudukan",
      "icon": "assets/icons/kategori/administrasi-kependudukan.png"
    },
    {
      "name": "Batas Wilayah",
      "icon": "assets/icons/kategori/batas-wilayah.png"
    },
    {"name": "Banjir", "icon": "assets/icons/kategori/banjir.png"},
    {
      "name": "Fasilitas Publik",
      "icon": "assets/icons/kategori/fasilitas-publik.png"
    },
    {"name": "Iklan Rokok", "icon": "assets/icons/kategori/iklan-rokok.png"},
    {"name": "Koperasi", "icon": "assets/icons/kategori/koperasi.png"},
    {
      "name": "Pelayanan Perhubungan",
      "icon": "assets/icons/kategori/dishub.png"
    },
    {
      "name": "Bantuan Pendidikan",
      "icon": "assets/icons/kategori/bantuan-pendidikan.png"
    },
    {
      "name": "Bantuan Sosial",
      "icon": "assets/icons/kategori/bantuan-sosial.png"
    },
    {"name": "Pelayanan BPJS", "icon": "assets/icons/kategori/bpjs.png"},
    {
      "name": "Hasil Musyawarah",
      "icon": "assets/icons/kategori/hasil-musyawarah.png"
    },
    {"name": "Imunisasi", "icon": "assets/icons/kategori/imunisasi.png"},
    {"name": "Jaringan Air", "icon": "assets/icons/kategori/jaringan-air.png"},
    {"name": "Kecelakaan", "icon": "assets/icons/kategori/kecelakaan.png"},
    {"name": "Penanganan Limbah", "icon": "assets/icons/kategori/limbah.png"},
    {"name": "Orang Hilang", "icon": "assets/icons/kategori/orang-hilang.png"},
    {
      "name": "Pemadam Kebakaran",
      "icon": "assets/icons/kategori/pemadam-kebakaran.png"
    },
    {"name": "Posyandu", "icon": "assets/icons/kategori/posyandu.png"},
  ];
  Rx<List<Map<String, dynamic>>> foundKategori =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    foundKategori.value = allKategori;
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void filterKategori(String kategoriName) {
    List<Map<String, dynamic>> results = [];
    if (kategoriName.isEmpty) {
      results = allKategori;
    } else {
      results = allKategori
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(kategoriName.toLowerCase()))
          .toList();
    }
    foundKategori.value=results;
  }
}
