import 'dart:convert';

class AppUser {
  String? uid;
  DateTime? createdAt;
  String? firstName;
  String? lastName;
  String? password;
  String? email;

  AppUser({
    this.uid,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      createdAt: map['createdAt'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      password: map['password'],
      email: map['email'],
    );
  }
  String toJson() => json.encode(toMap());
  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, email: $email, password:$password)';
  }
}
