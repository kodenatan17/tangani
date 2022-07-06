import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tangani/app/controllers/auth_controller.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../../../widgets/app_style_text.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  final authC = Get.find<AuthController>();
  final String chatId = (Get.arguments as Map<String, dynamic>)["chatId"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgPrimaryColor,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: BorderRadius.circular(100),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  child: StreamBuilder<DocumentSnapshot<Object?>>(
                      stream: controller.streamReceiverData((Get.arguments
                          as Map<String, dynamic>)["receiverEmail"]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          var receiverData =
                              snapshot.data!.data() as Map<String, dynamic>;
                          if (receiverData["photoURL"] == "noimage") {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/avatar/noimage.png",
                                fit: BoxFit.cover,
                              ),
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                receiverData["photoURL"],
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                        }
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/avatar/noimage.png",
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.phone_circle),
            color: Colors.black87,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.videocam_circle),
            color: Colors.black87,
          ),
          SizedBox(width: 5)
        ],
        title: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.streamReceiverData(
                (Get.arguments as Map<String, dynamic>)["receiverEmail"]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                var receiverData =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receiverData["displayName"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "Terakhir dilihat " +
                          DateFormat.jm().format(
                            DateTime.parse(
                              receiverData["lastSignInTime"],
                            ),
                          ),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loading ...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Loading ...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              );
            }),
        centerTitle: false,
      ),
      body: WillPopScope(
        onWillPop: () {
          if (controller.isShowEmoji.isTrue) {
            controller.isShowEmoji.value = false;
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.streamChats(chatId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var chatsData = snapshot.data!.docs;
                      Timer(
                        Duration.zero,
                        () => controller.scrollC.jumpTo(
                            controller.scrollC.position.maxScrollExtent),
                      );
                      return ListView.builder(
                          controller: controller.scrollC,
                          itemCount: chatsData.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: kDefaultPadding,
                                  ),
                                  Text(
                                    "${chatsData[index]["groupTime"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ItemChat(
                                    isSender: chatsData[index]["chatSender"] ==
                                            authC.usersModel.value.email!
                                        ? true
                                        : false,
                                    chats: "${chatsData[index]["chats"]}",
                                    chatTime: chatsData[index]["chatTime"],
                                  ),
                                ],
                              );
                            } else {
                              if (chatsData[index]["groupTime"] ==
                                  chatsData[index]["groupTime"]) {
                                return ItemChat(
                                  chats: "${chatsData[index]["chats"]}",
                                  isSender: chatsData[index]["chatSender"] ==
                                          authC.usersModel.value.email!
                                      ? true
                                      : false,
                                  chatTime: "${chatsData[index]["chatTime"]}",
                                );
                              } else {
                                return Column(
                                  children: [
                                    Text(
                                      "${chatsData[index]["groupTime"]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ItemChat(
                                      isSender: chatsData[index]
                                                  ["chatSender"] ==
                                              authC.usersModel.value.email!
                                          ? true
                                          : false,
                                      chats: "${chatsData[index]["chats"]}",
                                      chatTime: chatsData[index]["chatTime"],
                                    ),
                                  ],
                                );
                              }
                            }
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: controller.isShowEmoji.isTrue
                      ? 5
                      : context.mediaQueryPadding.bottom),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: Get.width,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(
                      Icons.mic,
                      color: kDefaultColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      child: TextField(
                        autocorrect: false,
                        onEditingComplete: () => controller.newChat(
                          authC.usersModel.value.email!,
                          Get.arguments as Map<String, dynamic>,
                          controller.chatC.text,
                        ),
                        controller: controller.chatC,
                        focusNode: controller.focusNode,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {
                              controller.focusNode.unfocus();
                              controller.isShowEmoji.toggle();
                            },
                            icon: Icon(Icons.emoji_emotions_outlined),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(100),
                    color: kDefaultColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () => controller.newChat(
                        authC.usersModel.value.email!,
                        Get.arguments as Map<String, dynamic>,
                        controller.chatC.text,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => (controller.isShowEmoji.isTrue)
                  ? Container(
                      height: 230,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          // Do something when emoji is tapped
                          controller.addEmojiToChat(emoji);
                        },
                        onBackspacePressed: () {
                          // Backspace-Button tapped logic
                          // Remove this line to also remove the button in the UI
                          controller.deteleEmojiToChat();
                        },
                        config: Config(
                            columns: 7,
                            emojiSizeMax:
                                32, // Issue: https://github.com/flutter/flutter/issues/28894
                            verticalSpacing: 0,
                            horizontalSpacing: 0,
                            initCategory: Category.RECENT,
                            bgColor: Color(0xFFF2F2F2),
                            indicatorColor: kDefaultColor,
                            iconColor: Colors.grey,
                            iconColorSelected: kDefaultColor,
                            progressIndicatorColor: kDefaultColor,
                            backspaceColor: kDefaultColor,
                            skinToneDialogBgColor: Colors.white,
                            skinToneIndicatorColor: Colors.grey,
                            enableSkinTones: true,
                            showRecentsTab: true,
                            recentsLimit: 28,
                            noRecents: const Text(
                              "No Recents",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black26),
                            ),
                            tabIndicatorAnimDuration: kTabScrollDuration,
                            categoryIcons: const CategoryIcons(),
                            buttonMode: ButtonMode.MATERIAL),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
    required this.chats,
    required this.chatTime,
  }) : super(key: key);

  final bool isSender;
  final String chats;
  final String chatTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
              color: isSender ? kDefaultColor : Colors.grey,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              "$chats",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(DateFormat.jm().format(DateTime.parse(chatTime))),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
