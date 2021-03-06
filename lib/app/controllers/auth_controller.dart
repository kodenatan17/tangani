import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tangani/app/data/models/users_model.dart';
import 'package:tangani/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  // Google SignIn
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  var usersModel = UsersModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

//----------------------USER AUTH SECTION------------------------------------\\

  Future<void> firstInitialized() async {
    //isAuth => true
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });
  }

  Future<bool> autoLogin() async {
    try {
      final isSignedIn = await _googleSignIn.isSignedIn();
      if (isSignedIn) {
        await _googleSignIn.signInSilently().then(
              (value) => _currentUser = value,
            );

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        //INSERT INTO FIRESTORE
        CollectionReference collUsers = firestore.collection('users');

        await collUsers.doc(_currentUser!.email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currUser = await collUsers.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        usersModel(UsersModel.fromJson(currUserData));
        usersModel.refresh();

        final listChats =
            await collUsers.doc(_currentUser!.email).collection("chats").get();
        if (listChats.docs.length != 0) {
          List<ChatsUser> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChats = element.data();
            var dataDocChatsId = element.id;
            dataListChats.add(ChatsUser(
              chatId: dataDocChatsId,
              connections: dataDocChats["connections"],
              lastTime: dataDocChats["lastTime"],
              totalUnread: dataDocChats["totalUnread"],
            ));
          });
          usersModel.update((users) {
            users!.chats = dataListChats;
          });
        } else {
          usersModel.update((users) {
            users!.chats = [];
          });
        }
        usersModel.refresh();

        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<void> loginGoogle() async {
    try {
      //HANDLE DATA BEFORE LOGIN
      await _googleSignIn.signOut();

      //GET DATA GOOGLE ACCOUNT
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      //CHECK STATUS LOGIN
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        //INSERT INTO FIRESTORE
        CollectionReference collUsers = firestore.collection('users');

        final checkUser = await collUsers.doc(_currentUser!.email).get();

        if (checkUser.data() == null) {
          await collUsers.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "displayName": _currentUser!.displayName,
            "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "email": _currentUser!.email,
            "photoURL": userCredential!.user!.photoURL ?? "noimage",
            "absenceStatus": "N/A",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "absenceTime": "N/A",
            "ktp": "N/A",
            "phone": "N/A",
            "statusUser": "user",
            "laporans": [],
          });

          await collUsers.doc(_currentUser!.email).collection("chats");
        } else {
          await collUsers.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        //GET DATA FIREBASE
        final currUser = await collUsers.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        usersModel(UsersModel.fromJson(currUserData));
        usersModel.refresh();

        final listChats =
            await collUsers.doc(_currentUser!.email).collection("chats").get();
        if (listChats.docs.length != 0) {
          List<ChatsUser> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChats = element.data();
            var dataDocChatsId = element.id;
            dataListChats.add(ChatsUser(
              chatId: dataDocChatsId,
              connections: dataDocChats["connections"],
              lastTime: dataDocChats["lastTime"],
              totalUnread: dataDocChats["totalUnread"],
            ));
          });
          usersModel.update((users) {
            users!.chats = dataListChats;
          });
        } else {
          usersModel.update((users) {
            users!.chats = [];
          });
        }
        usersModel.refresh();
        isAuth.value = true;
        if (usersModel.value.statusUser == "user") {
          Get.toNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.ADMIN);
        }
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

//----------------------USER UPDATE SECTION--------------------------------------\\

  void changeProfile(String displayName, String phone) {
    String? date = DateTime.now().toIso8601String();

    CollectionReference users = firestore.collection('users');

    users.doc(_currentUser!.email).update({
      "displayName": displayName,
      "keyName": displayName.substring(0, 1).toUpperCase(),
      "phone": phone,
      "lastSignInTime":
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
    });

    usersModel.update((users) {
      users!.displayName = displayName;
      users.keyName = displayName.substring(0, 1).toUpperCase();
      users.phone = phone.toString();
      users.lastSignInTime =
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String();
    });

    usersModel.refresh();
    Get.defaultDialog(
      title: "Success",
      middleText: "Change Profile Success",
    );
  }

//----------------------USER SEARCH SECTION--------------------------------------\\

  void addNewConnection(String receiverEmail) async {
    bool flagNewConnection = false;
    var chatId;
    String? date = DateTime.now().toIso8601String();
    CollectionReference collChats = firestore.collection("chats");
    CollectionReference collUsers = firestore.collection("users");

    //snapshot get all chatsdata
    final docChats =
        await collUsers.doc(_currentUser!.email).collection("chats").get();

    if (docChats.docs.length != 0) {
      //user sudah pernah chatting
      final checkConnections = await collUsers
          .doc(_currentUser!.email)
          .collection("chats")
          .where("connections", isEqualTo: receiverEmail)
          .get();
      if (checkConnections.docs.length != 0) {
        //sudah pernah chatting => receiverEmail
        flagNewConnection = false;
        //chatId from chats collection
        chatId = checkConnections.docs[0].id;
      } else {
        //belum pernah chatting => receiverEmail
        flagNewConnection = true;
      }
    } else {
      //belum pernah chatting
      // make conn
      flagNewConnection = true;
    }

    if (flagNewConnection) {
      //get collection. connection 2 emails
      final chatsDocs = await collChats.where(
        "connections",
        whereIn: [
          [
            _currentUser!.email,
            receiverEmail,
          ],
          [
            receiverEmail,
            _currentUser!.email,
          ],
        ],
      ).get();

      if (chatsDocs.docs.length != 0) {
        final chatsDataId = chatsDocs.docs[0].id;
        final chatsData = chatsDocs.docs[0].data() as Map<String, dynamic>;

        await collUsers
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatsDataId)
            .set({
          "connections": receiverEmail,
          "lastTime": chatsData["lastTime"],
          "totalUnread": 0
        });

        final listChats =
            await collUsers.doc(_currentUser!.email).collection("chats").get();
        if (listChats.docs.length != 0) {
          List<ChatsUser> dataListChats = List<ChatsUser>.empty();
          listChats.docs.forEach((element) {
            var dataDocChats = element.data();
            var dataDocChatsId = element.id;
            dataListChats.add(ChatsUser(
              chatId: dataDocChatsId,
              connections: dataDocChats["connections"],
              lastTime: dataDocChats["lastTime"],
              totalUnread: dataDocChats["totalUnread"],
            ));
          });
          usersModel.update((users) {
            users!.chats = dataListChats;
          });
        } else {
          usersModel.update((users) {
            users!.chats = [];
          });
        }

        chatId = chatsDataId;
        usersModel.refresh();
      } else {
        final newChatDoc = await collChats.add({
          "connections": [
            _currentUser!.email,
            receiverEmail,
          ],
        });

        await collChats.doc(newChatDoc.id).collection("chats");

        await collUsers
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(newChatDoc.id)
            .set({
          "connections": receiverEmail,
          "lastTime": date,
          "totalUnread": 0
        });

        final listChats =
            await collUsers.doc(_currentUser!.email).collection("chats").get();
        if (listChats.docs.length != 0) {
          List<ChatsUser> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChats = element.data();
            var dataDocChatsId = element.id;
            dataListChats.add(ChatsUser(
              chatId: dataDocChatsId,
              connections: dataDocChats["connections"],
              lastTime: dataDocChats["lastTime"],
              totalUnread: dataDocChats["totalUnread"],
            ));
          });
          usersModel.update((users) {
            users!.chats = dataListChats;
          });
        } else {
          usersModel.update((users) {
            users!.chats = [];
          });
        }

        chatId = newChatDoc.id;
        usersModel.refresh();
      }
    }
    //!=null

    final updateStatusChats = await collChats
        .doc(chatId)
        .collection("chats")
        .where("isRead", isEqualTo: false)
        .where("chatReceiver", isEqualTo: _currentUser!.email)
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
        .doc(_currentUser!.email)
        .collection("chats")
        .doc(chatId)
        .update({"totalUnread": 0});


    Get.toNamed(
      Routes.CHAT_ROOM,
      arguments: {
        "chatId": "$chatId",
        "receiverEmail": receiverEmail,
      },
    );
    //==null
  }
}
