import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String id;
  final String name;
  final String username;
  final String email;
  final DateTime createdon;
  final String instagram;
  final String youtube;
  final int followers_count;
  final int following_count;
  final int likes;
  final List<String> followers;
  final List<String> following;
  String? bio;

  Usermodel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.followers,
      required this.followers_count,
      required this.following,
      required this.following_count,
      required this.likes,
      required this.instagram,
      required this.youtube,
      required this.createdon,
      this.bio});

  static Usermodel fromsnap(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final datasnapshot = snapshot.data()!;
    return Usermodel(
      id: datasnapshot['id'] ?? '',
      name: datasnapshot['name'] ?? '',
      username: datasnapshot['username'] ?? '',
      email: datasnapshot['email'] ?? '',
      bio: datasnapshot['bio'] ?? '',
      instagram: datasnapshot['instagram'] ?? 'add instagram',
      youtube: datasnapshot['youtube'] ?? 'add youtube',
      createdon: (datasnapshot['createdon'] as Timestamp).toDate(),
      followers: List<String>.from(datasnapshot['followers'] ?? []),
      followers_count: datasnapshot['followers_count'] ?? 0,
      following: List<String>.from(datasnapshot['following'] ?? []),
      following_count: datasnapshot['following_count'] ?? 0,
      likes: datasnapshot['likes'] ?? 0,
    );
  }

  // factory Usermodel.fromMap(Map<String, dynamic> map) {
  //   return Usermodel(
  //       id: map['id'],
  //       name: map['name'],
  //       username: map['username'],
  //       email: map['email'],
  //       bio: map['bio'],
  //       createdon: map['createdon']);
  // }

  Map<String, dynamic> tomap() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'bio': bio,
        'instagram': instagram,
        'youtube': youtube,
        'followers': followers,
        'following': following,
        'followers_count': followers_count,
        'following_count': following_count,
        'likes': likes,
        'createdon': createdon
      };
}
