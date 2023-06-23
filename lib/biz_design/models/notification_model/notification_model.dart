// class NotificationModel {
//   String? time;
//   String? userAvatar;
//   String? userName;
//   String? title;
//   String? image;
//   String? content;
//   String? id;

//   NotificationModel(
//       {this.time,
//       this.userAvatar,
//       this.userName,
//       this.title,
//       this.image,
//       this.content,
//       this.id});

//   NotificationModel.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     userAvatar = json['userAvatar'];
//     userName = json['userName'];
//     title = json['title'];
//     image = json['image'];
//     content = json['content'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['time'] = time;
//     data['userAvatar'] = userAvatar;
//     data['userName'] = userName;
//     data['title'] = title;
//     data['image'] = image;
//     data['content'] = content;
//     data['id'] = id;
//     return data;
//   }

//   notificationMap() {
//     var mapping = <String, dynamic>{};
//     mapping['time'] = time!;
//     mapping['userAvatar'] = userAvatar!;
//     mapping['userName'] = userName!;
//     mapping['title'] = title!;
//     mapping['image'] = image!;
//     mapping['content'] = content!;
//     mapping['id'] = id;
//     return mapping;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'time': time,
//       'userAvatar': userAvatar,
//       'userName': userName,
//       'title': title,
//       'image': image,
//       'content': content,
//     };
//   }
// }

// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  String time;
  String userAvatar;
  String userName;
  String title;
  String image;
  String content;
  String id;

  NotificationModel({
    required this.time,
    required this.userAvatar,
    required this.userName,
    required this.title,
    required this.image,
    required this.content,
    required this.id,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        time: json["time"],
        userAvatar: json["userAvatar"],
        userName: json["userName"],
        title: json["title"],
        image: json["image"],
        content: json["content"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "userAvatar": userAvatar,
        "userName": userName,
        "title": title,
        "image": image,
        "content": content,
        "id": id,
      };
}
