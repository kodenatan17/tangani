class UsersModel {
  String? uid;
  String? displayName;
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

  UsersModel(
      {this.uid,
      this.displayName,
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
      this.statusUser});

  UsersModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
    absenceStatus = json['absenceStatus'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    absenceTime = json['absenceTime'];
    ktp = json['ktp'];
    password = json['password'];
    phone = json['phone'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoURL'] = photoURL;
    data['absenceStatus'] = absenceStatus;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['absenceTime'] = absenceTime;
    data['ktp'] = ktp;
    data['password'] = password;
    data['phone'] = phone;
    data['username'] = username;
    data['statusUser'] = statusUser;
    return data;
  }
}
