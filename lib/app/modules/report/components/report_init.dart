import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

class report_init extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future openDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Permission Access',
              style: AppStyleText.MODAL_TEXT,
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fitur ini mengakses, menyimpan, dan menggunakan",
                    style: AppStyleText.MODAL_TEXT,
                  ),
                  Text(
                    "\u2022 Kamera",
                    style: AppStyleText.MODAL_TEXT,
                  ),
                  Text(
                    "\u2022 Lokasi",
                    style: AppStyleText.MODAL_TEXT,
                  ),
                  Text(
                    "\u2022 Media Penyimpanan",
                    style: AppStyleText.MODAL_TEXT,
                  ),
                  Text(
                    "untuk kebutuhan penyimpanan tindak lanjut laporan",
                    style: AppStyleText.MODAL_TEXT,
                  ),
                  SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Baca ",
                        style: AppStyleText.SUBMODAL_TEXT,
                      ),
                      InkWell(
                        child: Text(
                          "Kebijakan dan Privasi",
                          style: AppStyleText.LINKSUBMODAL_TEXT,
                        ),
                        onTap: () {},
                      ),
                      Text(
                        " untuk lebih lengkap",
                        style: AppStyleText.SUBMODAL_TEXT,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      onPressed: requestPermissonWithOpenSetting,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kDefaultColor),
                      ),
                      icon: Icon(
                        // <-- Icon
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Saya Setuju',
                        style: TextStyle(color: Colors.white),
                      ), // <-- Text
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentukan jenis Laporan',
                    style: AppStyleText.CARDTITLE_TEXT,
                  ),
                  Text(
                    ' *',
                    style: AppStyleText.NOTED_TEXT,
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding * 0.5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(KDefaultCircular),
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "y",
                          groupValue: "",
                          onChanged: (value) {},
                        ),
                        Text(
                          'Privat/Rahasia',
                          textAlign: TextAlign.justify,
                          style: AppStyleText.CARDTITLE_TEXT,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 4.5,
                        vertical: kDefaultPadding * 0.2,
                      ),
                      child: Text(
                        'Laporan ini akan disembunyikan di aplikasi Tangani namun tetap masuk dalam sistem kami. Foto dan identitas kamu tidak akan terlihat (anonim) oleh publik ataupun petugas',
                        textAlign: TextAlign.justify,
                        style: AppStyleText.CARDSUBTITLE_TEXT,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(KDefaultCircular),
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "y",
                          groupValue: "",
                          onChanged: (value) {},
                        ),
                        Text(
                          'Publik',
                          textAlign: TextAlign.justify,
                          style: AppStyleText.CARDTITLE_TEXT,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 4.5,
                        vertical: kDefaultPadding * 0.2,
                      ),
                      child: Text(
                        'Laporan ini akan ditampilkan di aplikasi Tangani dan dapat dilihat oleh siapapun. Demi keamanan, pastikan tidak ada data pribadi kamu yang terekspos.',
                        textAlign: TextAlign.justify,
                        style: AppStyleText.CARDSUBTITLE_TEXT,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(KDefaultCircular),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.lightGreen,
                        size: 24,
                      ),
                      Text(
                        'Pelajari lebih jauh tentang privasi laporan',
                        style: AppStyleText.NOTED_TEXT,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    openDialog();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kDefaultColor),
                  ),
                  icon: Icon(
                    // <-- Icon
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Buat Laporan',
                    style: TextStyle(color: Colors.white),
                  ), // <-- Text
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void requestPermissonWithOpenSetting() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.location,
    ].request();
    print(
      "location permisson : ${statuses[Permission.location]},"
      "storage permission : ${statuses[Permission.storage]},"
      "camera permission : ${statuses[Permission.camera]}",
    );
    Get.toNamed(Routes.REPORT_MAIN);
    
  }
}
