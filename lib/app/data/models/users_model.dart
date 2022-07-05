// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
    UsersModel({
        this.uid,
        this.displayName,
        this.keyName,
        this.email,
        this.photoURL,
        this.absenceStatus,
        this.creationTime,
        this.lastSignInTime,
        this.absenceTime,
        this.ktp,
        this.password,
        this.phone,
        this.username,
        this.statusUser,
        this.chats,
        this.laporans,
    });

    String? uid;
    String? displayName;
    String? keyName;
    String? email;
    String? photoURL;
    String? absenceStatus;
    String? creationTime;
    String? lastSignInTime;
    String? absenceTime;
    String? ktp;
    String? password;
    String? phone;
    String? username;
    String? statusUser;
    List<ChatsUser>? chats;
    List<Laporan>? laporans;

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        uid: json["uid"],
        displayName: json["displayName"],
        keyName: json["keyName"],
        email: json["email"],
        photoURL: json["photoURL"],
        absenceStatus: json["absenceStatus"],
        creationTime: json["creationTime"],
        lastSignInTime: json["lastSignInTime"],
        absenceTime: json["absenceTime"],
        ktp: json["ktp"],
        password: json["password"],
        phone: json["phone"],
        username: json["username"],
        statusUser: json["statusUser"],
        chats: List<ChatsUser>.from(json["chats"].map((x) => ChatsUser.fromJson(x))),
        laporans: List<Laporan>.from(json["laporans"].map((x) => Laporan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "displayName": displayName,
        "keyName": keyName,
        "email": email,
        "photoURL": photoURL,
        "absenceStatus": absenceStatus,
        "creationTime": creationTime,
        "lastSignInTime": lastSignInTime,
        "absenceTime": absenceTime,
        "ktp": ktp,
        "password": password,
        "phone": phone,
        "username": username,
        "statusUser": statusUser,
        "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
        "laporans": List<dynamic>.from(laporans!.map((x) => x.toJson())),
    };
}

class ChatsUser {
    ChatsUser({
        this.connections,
        this.chatId,
        this.lastTime,
        this.totalUnread,
    });

    String? connections;
    String? chatId;
    String? lastTime;
    int? totalUnread;

    factory ChatsUser.fromJson(Map<String, dynamic> json) => ChatsUser(
        connections: json["connections"],
        chatId: json["chatId"],
        lastTime: json["lastTime"],
        totalUnread: json["totalUnread"]
    );

    Map<String, dynamic> toJson() => {
        "connections": connections,
        "chatId": chatId,
        "lastTime": lastTime,
        "totalUnread":totalUnread
    };
}

class Laporan {
    Laporan({
        required this.laporanId,
        required this.lastTime,
    });

    String laporanId;
    String lastTime;

    factory Laporan.fromJson(Map<String, dynamic> json) => Laporan(
        laporanId: json["laporanId"],
        lastTime: json["lastTime"],
    );

    Map<String, dynamic> toJson() => {
        "laporanId": laporanId,
        "lastTime": lastTime,
    };
}
