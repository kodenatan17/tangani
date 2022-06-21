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

        collUsers.doc(_currentUser!.email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currUser = await collUsers.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        usersModel(UsersModel(
          uid: currUserData["uid"],
          displayName: currUserData["displayName"],
          email: currUserData["email"],
          photoURL: currUserData["photoURL"],
          absenceStatus: currUserData["absenceStatus"],
          creationTime: currUserData["creationTime"],
          lastSignInTime: currUserData["lastSignInTime"],
          absenceTime: currUserData["absenceTime"],
          ktp: currUserData["ktp"],
          password: currUserData["passowrd"],
          phone: currUserData["phone"],
          username: currUserData["username"],
          statusUser: currUserData["statusUser"],
        ));

        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  void loginGoogle() async {
    try {
      //HANDLE DATA BEFORE LOGIN
      await _googleSignIn.signOut();

      //GET DATA GOOGLE ACCOUNT
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      //CHECK STATUS LOGIN
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        print("SUDAH BERHASIL LOGIN");
        print(_currentUser);

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
          collUsers.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "displayName": userCredential!.user!.displayName,
            "email": userCredential!.user!.email,
            "photoURL": userCredential!.user!.photoURL ?? "noimage",
            "absenceStatus": "N/A",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "absenceTime": "N/A",
            "ktp": "N/A",
            "password": "N/A",
            "phone": "N/A",
            "username": "N/A",
            "statusUser": "1",
          });
        } else {
          collUsers.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        //GET DATA FIREBASE
        final currUser = await collUsers.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        usersModel(UsersModel(
          uid: currUserData["uid"],
          displayName: currUserData["displayName"],
          email: currUserData["email"],
          photoURL: currUserData["photoURL"],
          absenceStatus: currUserData["absenceStatus"],
          creationTime: currUserData["creationTime"],
          lastSignInTime: currUserData["lastSignInTime"],
          absenceTime: currUserData["absenceTime"],
          ktp: currUserData["ktp"],
          password: currUserData["passowrd"],
          phone: currUserData["phone"],
          username: currUserData["username"],
          statusUser: currUserData["statusUser"],
        ));

        isAuth.value = true;
        if (usersModel.value.statusUser == 1) {
          Get.offAllNamed(AppPages.INITIAL);
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

  Future<void> login() async {
    Get.offAllNamed(AppPages.INITIAL);
  }

//----------------------USER UPDATE SECTION--------------------------------------\\

  void changeDisplayName(String displayName) {
    CollectionReference collUsers = firestore.collection('users');
    collUsers.doc(_currentUser!.displayName).update(
      {
        "displayName": displayName,
        "lastSignInTime":
            userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
      },
    );
    usersModel(
      UsersModel(
        displayName: displayName,
        lastSignInTime:
            userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
      ),
    );
    usersModel.refresh();
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Update Profile Berhasil",
    );
  }

  void changeUsername(String username) {}
  void changePhone(String phone) {}
  void changePassword(String password) {}
}
