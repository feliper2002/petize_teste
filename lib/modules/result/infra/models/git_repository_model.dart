// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:petize_teste/modules/result/domain/entities/git_repository.dart';

class GitRepositoryModel extends GitRepository {
  final String name;
  final String description;
  final int stargazersCount;
  final String updatedAt;
  GitRepositoryModel({
    required this.name,
    required this.description,
    required this.stargazersCount,
    required this.updatedAt,
  }) : super(
          name: name,
          description: description,
          stargazersCount: stargazersCount,
          updatedAt: updatedAt,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'stargazers_count': stargazersCount,
      'updated_at': updatedAt,
    };
  }

  factory GitRepositoryModel.fromMap(Map<String, dynamic> map) {
    return GitRepositoryModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      stargazersCount: map['stargazers_count']?.toInt() ?? 0,
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GitRepositoryModel.fromJson(String source) =>
      GitRepositoryModel.fromMap(json.decode(source));

  GitRepositoryModel copyWith({
    String? name,
    String? description,
    int? stargazersCount,
    String? updatedAt,
  }) {
    return GitRepositoryModel(
      name: name ?? this.name,
      description: description ?? this.description,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
