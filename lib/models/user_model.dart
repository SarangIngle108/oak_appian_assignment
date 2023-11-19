
import 'dart:io';

class UserModel {
  final String name;
  final String uid;
  final String phoneNumber;
  final List<Video> Videos;
  UserModel({
    required this.name,
    required this.uid,
    required this.phoneNumber,
    this.Videos = const [],
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'phoneNumber': phoneNumber,
      'Videos': Videos,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      Videos: List<Video>.from(map['Videos']),
    );
  }
}
class Video {
  File file;
  String title;
  String Description;
  String Category;
  String location;
  String url;

  Video({
    required this.file,
    required this.title,
    required this.url,
    required this.location,
    required this.Category,
    required this.Description,
  });}