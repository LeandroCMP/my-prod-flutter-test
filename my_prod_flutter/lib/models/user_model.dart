// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String user;
  final String name;
  final String image;
  final String bio;
  UserModel({
    required this.user,
    required this.name,
    required this.image,
    required this.bio,
  });

  UserModel copyWith({
    String? user,
    String? name,
    String? image,
    String? bio,
  }) {
    return UserModel(
      user: user ?? this.user,
      name: name ?? this.name,
      image: image ?? this.image,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'name': name,
      'image': image,
      'bio': bio,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user: map['login'] ?? '',
      name: map['name'] ?? map['login'] ?? '',
      image: map['avatar_url'] ?? '',
      bio: map['bio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(user: $user, name: $name, image: $image, bio: $bio)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.name == name &&
        other.image == image &&
        other.bio == bio;
  }

  @override
  int get hashCode {
    return user.hashCode ^ name.hashCode ^ image.hashCode ^ bio.hashCode;
  }
}
