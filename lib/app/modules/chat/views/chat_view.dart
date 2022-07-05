import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/controllers/auth_controller.dart';
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
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: controller.chatsStream(authC.usersModel.value.email!),
            builder: (context, snapshot1) {
              if (snapshot1.connectionState == ConnectionState.active) {
                var allChats = (snapshot1.data!.data()
                    as Map<String, dynamic>)["chats"] as List;
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: allChats.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder(builder: (context, snapshot2) {
                        if (snapshot2.connectionState ==
                            ConnectionState.active) {
                          return ListTile(
                            onTap: () => Get.toNamed(Routes.CHAT_ROOM),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black26,
                              child: Image.asset(
                                "assets/avatar/noimage.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              "Orang ke ${index + 1}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              "Pesan ke ${index + 1}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Chip(
                              label: Text("${allChats[index]["totalUnread"]}"),
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CHAT_SEARCH),
        child: Icon(Icons.message_rounded),
        backgroundColor: kDefaultColor,
      ),
    );
  }
}
