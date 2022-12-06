import 'dart:convert';

class UserModel {
  final String login;
  final String name;
  final String bio;
  final String twitterUsername;
  final String location;
  final String siteAdmin;
  final String company;
  final String email;
  UserModel({
    required this.login,
    required this.name,
    required this.bio,
    required this.twitterUsername,
    required this.location,
    required this.siteAdmin,
    required this.company,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'name': name,
      'bio': bio,
      'twitter_username': twitterUsername,
      'location': location,
      'siteAdmin': siteAdmin,
      'company': company,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      login: map['login'] ?? '',
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      twitterUsername: map['twitter_username'] ?? '',
      location: map['location'] ?? '',
      siteAdmin: map['site_admin'] ?? '',
      company: map['company'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
