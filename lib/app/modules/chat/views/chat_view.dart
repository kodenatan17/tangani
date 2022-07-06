import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/controllers/auth_controller.dart';
import 'package:tangani/app/data/models/users_model.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../controllers/chat_controller.dart';

class ChatView extends StatelessWidget {
  final controller = Get.put(ChatController());
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        title: Text(
          'Chats',
          style: AppStyleText.TANGA_TITLE_PAGE,
        ),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.chatsStream(authC.usersModel.value.email!),
          builder: (context, snapshot1) {
            if (snapshot1.connectionState == ConnectionState.active) {
              var listDocsChats = snapshot1.data!.docs;
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: listDocsChats.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                        stream: controller.receiverStream(
                            listDocsChats[index]["connections"]),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState ==
                              ConnectionState.active) {
                            var data = snapshot2.data!.data();
                            return data!["statusUser"] == ""
                                ? ListTile(
                                    onTap: () => controller.goToChatRoom(
                                      "${listDocsChats[index].id}",
                                      authC.usersModel.value.email!,
                                      listDocsChats[index]["connections"],
                                    ),
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.black26,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: data["photoURL"] == "noimage"
                                            ? Image.asset(
                                                "assets/avatar/noimage.png",
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                "${data["photoURL"]}",
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    title: Text(
                                      "${data["displayName"]}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    trailing: listDocsChats[index]
                                                ["totalUnread"] ==
                                            0
                                        ? SizedBox()
                                        : Chip(
                                            backgroundColor: kDefaultColor,
                                            label: Text(
                                              "${listDocsChats[index]["totalUnread"]}",
                                              style: TextStyle(
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                  )
                                : ListTile(
                                    onTap: () => controller.goToChatRoom(
                                      "${listDocsChats[index].id}",
                                      authC.usersModel.value.email!,
                                      listDocsChats[index]["connections"],
                                    ),
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.black26,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: data["photoURL"] == "noimage"
                                            ? Image.asset(
                                                "assets/avatar/noimage.png",
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                "${data["photoURL"]}",
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    title: Text(
                                      "${data["displayName"]}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${data["statusUser"]}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    trailing: listDocsChats[index]
                                                ["totalUnread"] ==
                                            0
                                        ? SizedBox()
                                        : Chip(
                                            backgroundColor: kDefaultColor,
                                            label: Text(
                                              "${listDocsChats[index]["totalUnread"]}",
                                              style: TextStyle(
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                  );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CHAT_SEARCH),
        child: Icon(Icons.message_rounded),
        backgroundColor: kDefaultColor,
      ),
    );
  }
}
