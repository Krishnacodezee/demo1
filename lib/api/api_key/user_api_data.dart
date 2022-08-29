// To parse this JSON data, do
//
//     final userApiData = userApiDataFromMap(jsonString);

import 'dart:convert';

class UserApiData {
  int? id;
  int? userId;
  String? title;
  String? dueOn;
  String? status;

  UserApiData({this.id, this.userId, this.title, this.dueOn, this.status});

  UserApiData.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    userId = json['user_id']??0;
    title = json['title']??'';
    dueOn = json['due_on']??'';
    status = json['status']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['due_on'] = this.dueOn;
    data['status'] = this.status;
    return data;
  }
}


// class UserApiData {
//   UserApiData({
//     this.id,
//     this.userId,
//     this.title,
//     this.dueOn,
//     this.status,
//   });
//
//   int? id;
//   int? userId;
//   String? title;
//   DateTime? dueOn;
//   Status? status;
//
//   factory UserApiData.fromJson(String str) =>
//       UserApiData.fromMap(json.decode(str.toString()));
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "title": title,
//         "due_on": dueOn,
//         "Status": status,
//       };
//   // String toJson() => json.encode(toMap());
//
//   factory UserApiData.fromMap(Map<String, dynamic> json) => UserApiData(
//         id: json["id"] ?? 0,
//         userId: json["user_id"] ?? 0,
//         title: json["title"] ?? '',
//         dueOn: DateTime.parse(json["due_on"] ?? DateTime.now()),
//         status: statusValues.map![json["status"] ?? ''],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "user_id": userId,
//         "title": title,
//         "due_on": dueOn.toString(),
//         "status": statusValues.reverse[status],
//       };
// }
//
// enum Status { PENDING, COMPLETED }
//
// final statusValues =
//     EnumValues({"completed": Status.COMPLETED, "pending": Status.PENDING});
//
// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map!.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap ?? {};
//   }
// }
