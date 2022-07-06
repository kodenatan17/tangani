import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  var isShowEmoji = false.obs;
  int totalUnread = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late FocusNode focusNode;
  late TextEditingController chatC;
  late ScrollController scrollC;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamChats(String chatId) {
    CollectionReference collChats = firestore.collection("chats");

    return collChats
        .doc(chatId)
        .collection("chats")
        .orderBy("chatTime")
        .snapshots();
  }

  Stream<DocumentSnapshot<Object?>> streamReceiverData(String receiverEmail) {
    CollectionReference collUsers = firestore.collection("users");

    return collUsers.doc(receiverEmail).snapshots();
  }

  void addEmojiToChat(Emoji emoji) {
    chatC.text = chatC.text + emoji.emoji;
  }

  void deteleEmojiToChat() {
    chatC.text = chatC.text.substring(0, chatC.text.length - 2);
  }

  void newChat(
      String email, Map<String, dynamic> arguments, String chats) async {
    if (chats != "") {
      CollectionReference collChats = firestore.collection("chats");
      CollectionReference collUsers = firestore.collection("users");
      String date = DateTime.now().toIso8601String();

      await collChats.doc(arguments["chatId"]).collection("chats").add({
        "chatSender": email,
        "chatReceiver": arguments["receiverEmail"],
        "chats": chats,
        "chatTime": date,
        "isRead": false,
      });

      Timer(
        Duration.zero,
        () => scrollC.jumpTo(scrollC.position.maxScrollExtent),
      );

      chatC.clear();
      //update users collection chats lastTime
      await collUsers
          .doc(email)
          .collection("chats")
          .doc(arguments["chatId"])
          .update({
        "lastTime": date,
      });
      //checkdata receiver
      final checkChatsReceiver = await collUsers
          .doc(arguments["receiverEmail"])
          .collection("chats")
          .doc(arguments["chatId"])
          .get();
      if (checkChatsReceiver.exists) {
        //update for receiver db
        //1st check totalUnread
        final checkTotalUnread = await collUsers
            .doc(arguments["chatId"])
            .collection("chats")
            .where("isRead", isEqualTo: false)
            .where("chatSender", isEqualTo: email)
            .get();
        //total Unread receiver DB
        totalUnread = checkTotalUnread.docs.length;
        await collUsers
            .doc(email)
            .collection("chats")
            .doc(arguments["chatId"])
            .update({
          "lastTime": date,
          "totalUnread": totalUnread,
        });
      } else {
        //new for receiver db
        await collUsers
            .doc(arguments["receiverEmail"])
            .collection("chats")
            .doc(arguments["chatId"])
            .set({
          "connections": email,
          "lastTime": date,
          "totalUnread": totalUnread,
        });
      }
    }
  }

  @override
  void onInit() {
    chatC = TextEditingController();
    scrollC = ScrollController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isShowEmoji.value = false;
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    scrollC.dispose();
    chatC.dispose();
    focusNode.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
