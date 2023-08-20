// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RepositoriesModel {
  String name;
  String description;
  String language;
  int stars;
  int branchs;

  RepositoriesModel({
    required this.name,
    required this.description,
    required this.language,
    required this.stars,
    required this.branchs,
  });

  RepositoriesModel copyWith({
    String? name,
    String? description,
    String? language,
    int? stars,
    int? branchs,
  }) {
    return RepositoriesModel(
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
      stars: stars ?? this.stars,
      branchs: branchs ?? this.branchs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'language': language,
      'stars': stars,
      'branchs': branchs,
    };
  }

  factory RepositoriesModel.fromMap(Map<String, dynamic> map) {
    return RepositoriesModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      language: map['language'] ?? '',
      stars: map['stargazers_count'] ?? 0,
      branchs: map['forks'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RepositoriesModel.fromJson(String source) =>
      RepositoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RepositoriesModel(name: $name, description: $description, language: $language ,stars: $stars, branchs: $branchs)';
  }

  @override
  bool operator ==(covariant RepositoriesModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.language == language &&
        other.stars == stars &&
        other.branchs == branchs;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        language.hashCode ^
        stars.hashCode ^
        branchs.hashCode;
  }
}
