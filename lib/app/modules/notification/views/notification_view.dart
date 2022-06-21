import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tangani/app/widgets/app_style_text.dart';
import 'package:tangani/app/widgets/constants.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  final List<Widget> myChats = List.generate(
    15,
    (index) => Column(
      children: [
        ListTile(
          onTap: () {},
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black26,
            child: Image.asset(
              "assets/avatar/noimage.png",
              fit: BoxFit.cover,
            ),
          ),
          title:
              Column(children:[ 
                Text("Orang ke ${index + 1}", style: AppStyleText.CARDTITLE_TEXT,),
                Text("Durasi :  ${index + 1}", style: AppStyleText.CARDTITLE_TEXT,),
                ],),
          subtitle: Text(
            "Durasi : ${index + 1}",
            style: AppStyleText.CARDSUBTITLE_TEXT,
          ),
        ),
        Divider(
          height: 5,
          color: Colors.black,
        )
      ],
    ),
  ).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBgPrimaryColor,
          title: Text(
            "Notifikasi",
            style: AppStyleText.TANGA_APPBAR_PAGE,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
              color: kDefaultColor,
            ),
          ]),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: myChats.length,
                  itemBuilder: (context, index) => myChats[index],
                ),
              ),
            ],
          ),),
    );
  }
}
