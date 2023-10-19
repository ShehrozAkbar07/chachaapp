class Usermodel {
  String? uid;
  String? email;
  String? username;
  List? abc;

  // List<Questions>? questions;

  Usermodel({
    this.uid,
    this.email,
    this.username,
  });

  //receive data to server

  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }
  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
    };
  }
}
