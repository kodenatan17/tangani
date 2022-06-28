import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportMainController extends GetxController {
  var currentStep = 0.obs; //index stepper

  final c = TextEditingController();

  var selectedImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    foundKategori.value = allKategori;
  }

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
    {"name": "Kecelakaan", "icon": "assets/icons/kategori/kecelakaan.png"},
    {"name": "Penanganan Limbah", "icon": "assets/icons/kategori/limbah.png"},
    {"name": "Jaringan Air", "icon": "assets/icons/kategori/jaringan-air.png"},
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
    foundKategori.value = results;
  }

  final List<String> listRT = [
    'RT 01',
    'RT 02',
    'RT 03',
    'RT 04',
    'RT 05',
    'RT 06',
    'RT 07',
    'RT 08',
    'RT 09',
    'RT 10',
    'RT 11',
    'RT 12',
  ];
  final SelectedValueRT = ''.obs;

  void setSelectedValueRT(String? value){
    SelectedValueRT.value = value!;
  }

  final List<String> listRW = [
    'RW 01',
    'RW 02',
    'RW 03',
    'RW 04',
    'RW 05',
    'RW 06',
    'RW 07',
    'RW 08',
    'RW 09',
    'RW 10',
    'RW 11',
    'RW 12',
    'RW 13',
    'RW 14',
    'RW 15',
    'RW 16',
    'RW 17',
    'RW 18',
    'RW 19',
    'RW 20',
    'RW 21',
    'RW 22',
    'RW 23',
    'RW 24',
    'RW 25',
    'RW 26',
  ];
  final selectedValueRW = ''.obs;
  void setSelectedValueRW(String? value){
    selectedValueRW.value = value!;
  }
}
