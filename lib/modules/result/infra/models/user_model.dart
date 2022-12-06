// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:petize_teste/modules/result/domain/entities/user.dart';

class UserModel extends User {
  final String login;
  final String name;
  final String bio;
  final String twitterUsername;
  final String location;
  final String blog;
  final bool siteAdmin;
  final String company;
  final String email;
  UserModel({
    required this.login,
    required this.name,
    required this.bio,
    required this.twitterUsername,
    required this.location,
    required this.blog,
    required this.siteAdmin,
    required this.company,
    required this.email,
  }) : super(
          login: login,
          name: name,
          bio: bio,
          twitterUsername: twitterUsername,
          location: location,
          blog: blog,
          siteAdmin: siteAdmin,
          company: company,
          email: email,
        );

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'name': name,
      'bio': bio,
      'twitter_username': twitterUsername,
      'location': location,
      'blog': blog,
      'site_admin': siteAdmin,
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
      blog: map['blog'] ?? '',
      siteAdmin: map['site_admin'] ?? false,
      company: map['company'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? login,
    String? name,
    String? bio,
    String? twitterUsername,
    String? location,
    String? blog,
    bool? siteAdmin,
    String? company,
    String? email,
  }) {
    return UserModel(
      login: login ?? this.login,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      location: location ?? this.location,
      blog: blog ?? this.blog,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      company: company ?? this.company,
      email: email ?? this.email,
    );
  }
}
