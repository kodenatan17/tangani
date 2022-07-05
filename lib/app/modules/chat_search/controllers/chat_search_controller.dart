import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSearchController extends GetxController {
  //TODO: Implement ChatSearchController
  late TextEditingController searchC;

  var initQuery = [].obs;
  var tempSearch = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void searchContact(String data, String email) async {
    if (data.length == 0) {
      initQuery.value = [];
      tempSearch.value = [];
    } else {
      var capitalized = data.substring(0, 1).toUpperCase() + data.substring(1);
      if (initQuery.length == 0 && data.length == 1) {
        //live search obx
        CollectionReference users = await firestore.collection("users");
        final keyNameResult = await users
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            .where("email", isNotEqualTo: email)
            .get();
        if (keyNameResult.docs.length > 0) {
          for (int i = 0; i < keyNameResult.docs.length; i++) {
            initQuery.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }
        } else {
          print("Tidak ada data");
        }
      }
      if (initQuery.length != 0) {
        tempSearch.value = [];
        initQuery.forEach((element) {
          if (element["displayName"].startsWith(capitalized)) {
            tempSearch.add(element);
          }
        });
      }
    }
    initQuery.refresh();
    tempSearch.refresh();
  }

  final count = 0.obs;
  @override
  void onInit() {
    searchC = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchC.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
