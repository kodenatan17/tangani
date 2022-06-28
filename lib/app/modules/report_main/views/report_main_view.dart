import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';
import 'package:tangani/app/widgets/spacer_style.dart';

import '../controllers/report_main_controller.dart';

class ReportMainView extends GetView<ReportMainController> {
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  var locationLaporanC = TextEditingController();
  var jenisLaporanC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        title: Text(
          'Laporan Detail',
          style: AppStyleText.TANGA_TITLE_PAGE,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Obx(
        () => Stepper(
          type: StepperType.horizontal,
          steps: buildStep(context),
          currentStep: controller.currentStep.value,
          onStepContinue: () {
            if (!formKeys[controller.currentStep.value]
                .currentState!
                .validate()) {
              return;
            }

            if (controller.currentStep.value == buildStep(context).length - 1) {
              print("Send data to Server");
            } else {
              controller.currentStep.value++;
            }
          },
          onStepCancel: () {
            controller.currentStep.value == 0
                ? null
                : controller.currentStep.value--;
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        controller.currentStep.value ==
                                buildStep(context).length - 1
                            ? "Proses"
                            : "Lanjut",
                      ),
                      onPressed: details.onStepContinue,
                    ),
                  ),
                  SizedBox(width: kDefaultPadding * 2),
                  if (controller.currentStep.value != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Kembali"),
                        onPressed: details.onStepCancel,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Step> buildStep(BuildContext context) {
    return [
      Step(
        title: Icon(Icons.camera_alt_outlined),
        subtitle: Text('Foto'),
        content: Form(
          key: formKeys[0],
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ambil Foto Laporan',
                      style: AppStyleText.CARDTITLE_TEXT,
                    ),
                    Text(
                      ' *',
                      style: AppStyleText.NOTED_TEXT,
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => ClipRRect(
                      borderRadius: BorderRadius.circular(
                        KDefaultCircular,
                      ),
                      child: controller.selectedImagePath.value == ''
                          ? Image.asset("assets/images/default_image.png")
                          : Image.file(
                              File(controller.selectedImagePath.value),
                              fit: BoxFit.cover,
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) {
                                  return child;
                                }
                                return AnimatedOpacity(
                                  opacity: frame == null ? 0 : 1,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeOut,
                                  child: child,
                                );
                              },
                            ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      label: Text('Galeri'),
                      onPressed: () {
                        controller.getImage(ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      label: Text('Camera'),
                      onPressed: () {
                        controller.getImage(ImageSource.camera);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        isActive: controller.currentStep.value >= 0,
        state: controller.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: Icon(Icons.category_outlined),
        subtitle: Text('Kategori'),
        content: Form(
          key: formKeys[1],
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tentukan Kategori Laporan',
                      style: AppStyleText.CARDTITLE_TEXT,
                    ),
                    Text(
                      ' *',
                      style: AppStyleText.NOTED_TEXT,
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (value) => controller.filterKategori(value),
                  controller: jenisLaporanC,
                  decoration: const InputDecoration(
                    labelText: "Search",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 0.2,
                        crossAxisSpacing: 0.2,
                      ),
                      itemCount: controller.allKategori.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.grey.shade300,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(KDefaultCircular),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                        context: context,
                                        builder: (_) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: kDefaultPadding,
                                            ),
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            margin: const EdgeInsets.symmetric(
                                              vertical: kDefaultPadding,
                                              horizontal: kDefaultPadding,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(
                                                  '${controller.allKategori[index]['icon']}',
                                                  width: 44,
                                                  height: 44,
                                                  fit: BoxFit.cover,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          kDefaultPadding * 1.5,
                                                    ),
                                                    Text(
                                                      "KATEGORI",
                                                      style: AppStyleText
                                                          .MODALTITLE_TEXT,
                                                    ),
                                                    Text(
                                                      controller.allKategori[
                                                          index]['name'],
                                                      style: AppStyleText
                                                          .MODALSUBTITLE_TEXT,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(
                                                        jenisLaporanC.text =
                                                            '${controller.allKategori[index]['name']}');
                                                  },
                                                  child: const Text('Pilih'),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  icon: Image.asset(
                                    '${controller.allKategori[index]['icon']}',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: kDefaultPadding / 2,
                              ),
                              Text(controller.allKategori[index]['name'],
                                  style: AppStyleText.MENUTILE_TEXT,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        isActive: controller.currentStep.value >= 1,
        state: controller.currentStep.value > 1
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: Icon(Icons.newspaper_outlined),
        subtitle: Text('Detail'),
        content: Form(
          key: formKeys[2],
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Foto Laporanmu',
                        style: AppStyleText.CARDTITLE_TEXT,
                      ),
                      Text(
                        ' *',
                        style: AppStyleText.NOTED_TEXT,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        KDefaultCircular,
                      ),
                      child: controller.selectedImagePath.value == ''
                          ? Image.asset("assets/images/default_image.png")
                          : Image.file(
                              File(controller.selectedImagePath.value),
                              fit: BoxFit.cover,
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) {
                                  return child;
                                }
                                return AnimatedOpacity(
                                  opacity: frame == null ? 0 : 1,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeOut,
                                  child: child,
                                );
                              },
                            ),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis Laporanmu',
                        style: AppStyleText.CARDTITLE_TEXT,
                      ),
                      Text(
                        ' *',
                        style: AppStyleText.NOTED_TEXT,
                      ),
                    ],
                  ),
                  TextField(
                    enabled: false,
                    controller: jenisLaporanC,
                    decoration: InputDecoration(labelText: "Jenis Laporan"),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lokasi Laporanmu',
                        style: AppStyleText.CARDTITLE_TEXT,
                      ),
                      Text(
                        ' *',
                        style: AppStyleText.NOTED_TEXT,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => DropdownButton2<String>(
                            onChanged: (newValue) {
                              controller.setSelectedValueRW(newValue);
                            },
                            value: controller.selectedValueRW.value == ""
                                ? null
                                : controller.selectedValueRW.value,
                            items: controller.listRW.map((selectedRW) {
                              return DropdownMenuItem(
                                child: new Text(selectedRW),
                                value: selectedRW,
                              );
                            }).toList(),
                            isExpanded: true,
                            hint: Row(
                              children: const [
                                Icon(
                                  Icons.list,
                                  size: 12,
                                  color: kBgPrimaryColor,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    "Pilih RW",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: kBgPrimaryColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Expanded(
                        child: Obx(
                          () => DropdownButton2<String>(
                            onChanged: (newValue) {
                              controller.setSelectedValueRT(newValue);
                            },
                            value: controller.SelectedValueRT.value == ""
                                ? null
                                : controller.SelectedValueRT.value,
                            items: controller.listRT.map((selectedRT) {
                              return DropdownMenuItem(
                                child: new Text(selectedRT),
                                value: selectedRT,
                              );
                            }).toList(),
                            isExpanded: true,
                            hint: Row(
                              children: const [
                                Icon(
                                  Icons.list,
                                  size: 12,
                                  color: kBgPrimaryColor,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    "Pilih RW",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: kBgPrimaryColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ceritakan Laporan Kamu',
                        style: AppStyleText.CARDTITLE_TEXT,
                      ),
                      Text(
                        ' *',
                        style: AppStyleText.NOTED_TEXT,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(KDefaultCircular),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail permasalahan dapat memuat info berupa waktu kejadian, jenis pelanggaran, beberapa kegiatan, dsb.',
                          style: AppStyleText.NOTED_TEXT,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    autofocus: false,
                    minLines: 5,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'input tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Permasalahan",
                      hintText:
                          'Contoh : Seorang pria terlihat membuat sampah sembarangan, walaupun sudah ada larangan dari pemerintah tentang pembuangan sampah sembarangan, namun pria tersebut masih membuang sembarangan',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(KDefaultCircular * 0.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text("Minimal 50 Karakter"),
                  SpacerStyle(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ceritakan Solusi Kamu',
                        style: AppStyleText.CARDTITLE_TEXT,
                      ),
                      Text(
                        ' *',
                        style: AppStyleText.NOTED_TEXT,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(KDefaultCircular),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail solusi dari permasalahan yang didapat berupa solusi penyelesaian masalah',
                          style: AppStyleText.NOTED_TEXT,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    autofocus: false,
                    minLines: 5,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'input tidak boleh kosong';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: "Solusi",
                      hintText:
                          'Contoh : Memperketat dengan mendirikan pos pemantuan khusus pembuangan sampah',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(KDefaultCircular * 0.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text("Minimal 50 Karakter"),
                ],
              ),
            ),
          ),
        ),
        isActive: controller.currentStep.value >= 2,
        state: controller.currentStep.value > 2
            ? StepState.complete
            : StepState.indexed,
      )
    ];
  }
}
