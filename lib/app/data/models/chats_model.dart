// To parse this JSON data, do
//
//     final chatsModel = chatsModelFromJson(jsonString);

import 'dart:convert';

ChatsModel chatsModelFromJson(String str) => ChatsModel.fromJson(json.decode(str));

String chatsModelToJson(ChatsModel data) => json.encode(data.toJson());

class ChatsModel {
    ChatsModel({
        this.connections,
        this.chats,
    });

    List<String>? connections;
    List<Chats>? chats;

    factory ChatsModel.fromJson(Map<String, dynamic> json) => ChatsModel(
        connections: List<String>.from(json["connections"].map((x) => x)),
        chats: List<Chats>.from(json["chats"].map((x) => Chats.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "connections": List<dynamic>.from(connections!.map((x) => x)),
        "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
    };
}

class Chats {
    Chats({
        required this.chatSender,
        required this.chatReceiver,
        required this.chats,
        required this.chatTime,
        required this.isRead,
    });

    String chatSender;
    String chatReceiver;
    String chats;
    String chatTime;
    bool isRead;

    factory Chats.fromJson(Map<String, dynamic> json) => Chats(
        chatSender: json["chatSender"],
        chatReceiver: json["chatReceiver"],
        chats: json["chats"],
        chatTime: json["chatTime"],
        isRead: json["isRead"],
    );

    Map<String, dynamic> toJson() => {
        "chatSender": chatSender,
        "chatReceiver": chatReceiver,
        "chats": chats,
        "chatTime": chatTime,
        "isRead": isRead,
    };
}
