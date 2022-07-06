import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ChatController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> chatsStream(String email) {
    return firestore
        .collection('users')
        .doc(email)
        .collection("chats")
        .orderBy("lastTime", descending: true)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> receiverStream(String email) {
    return firestore.collection('users').doc(email).snapshots();
  }

  void goToChatRoom(String chatId, String email, String receiverEmail) async {
    CollectionReference collChats = firestore.collection("chats");
    CollectionReference collUsers = firestore.collection("users");

    final updateStatusChats = await collChats
        .doc(chatId)
        .collection("chats")
        .where("isRead", isEqualTo: false)
        .where("chatReceiver", isEqualTo: email)
        .get();
    //update isRead true
    updateStatusChats.docs.forEach((element) async {
      await collChats
          .doc(chatId)
          .collection("chats")
          .doc(element.id)
          .update({"isRead": true});
    });
    //update totalUnread 0
    await collUsers
        .doc(email)
        .collection("chats")
        .doc(chatId)
        .update({"totalUnread": 0});

    Get.toNamed(
      Routes.CHAT_ROOM,
      arguments: {
        "chatId": chatId,
        "receiverEmail": receiverEmail,
      },
    );
  }
}
