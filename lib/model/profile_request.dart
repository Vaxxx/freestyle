// To parse this JSON data, do
//
//     final profileRequest = profileRequestFromJson(jsonString);

import 'dart:convert';

List<ProfileRequest> profileRequestFromJson(String str) =>
    List<ProfileRequest>.from(
        json.decode(str).map((x) => ProfileRequest.fromJson(x)));

String profileRequestToJson(List<ProfileRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileRequest {
  ProfileRequest({
    this.id,
    this.userId,
    this.firstname,
    this.lastname,
    this.phone,
    this.city,
    this.country,
    this.bio,
    this.genre,
    this.hobby,
    this.discipline,
    this.pictureName,
    this.bannerName,
    this.picture,
    this.banner,
    this.question,
    this.answer,
  });

  ProfileRequest.user(
      {required this.firstname,
      required this.lastname,
      required this.phone,
      required this.bio,
      required this.city,
      required this.country,
      required this.pictureName,
      required this.bannerName,
      required this.picture,
      required this.banner,
      required this.question,
      required this.answer}) {
    firstname = firstname;
    lastname = lastname;
    phone = phone;
    bio = bio;
    city = city;
    country = country;
    pictureName = pictureName;
    bannerName = bannerName;
    picture = picture;
    banner = banner;
    question = question;
    answer = answer;
  }

  ProfileRequest.profile(
      {required this.firstname,
      required this.lastname,
      required this.phone,
      required this.bio,
      required this.city,
      required this.country,
      required this.pictureName,
      required this.bannerName,
      required this.picture,
      required this.banner}) {
    firstname = firstname;
    lastname = lastname;
    phone = phone;
    bio = bio;
    city = city;
    country = country;
    pictureName = pictureName;
    bannerName = bannerName;
    picture = picture;
    banner = banner;
  }

  ProfileRequest.name({required this.firstname, required this.lastname}) {
    firstname = firstname;
    lastname = lastname;
  }

  int? id;
  int? userId;
  String? firstname;
  String? lastname;
  String? phone;
  String? city;
  String? country;
  String? bio;
  String? pictureName;
  String? bannerName;
  List<Genre>? genre;
  List<Hobby>? hobby;
  List<Discipline>? discipline;
  String? picture;
  String? banner;
  String? question;
  String? answer;

  factory ProfileRequest.fromJson(Map<String, dynamic> json) => ProfileRequest(
        id: json["id"],
        userId: json["user_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        city: json["city"],
        country: json["country"],
        bio: json["bio"],
        pictureName: json["pictureName"],
        bannerName: json["bannerName"],
        genre: List<Genre>.from(json["genre"].map((x) => Genre.fromJson(x))),
        hobby: List<Hobby>.from(json["hobby"].map((x) => Hobby.fromJson(x))),
        discipline: List<Discipline>.from(
            json["discipline"].map((x) => Discipline.fromJson(x))),
        picture: json["picture"],
        banner: json["banner"],
        question: json["question"],
        answer: json["answer"],
      );

  factory ProfileRequest.fromJsonAgain(Map<String, dynamic> json) =>
      ProfileRequest(
        id: json["id"],
        userId: json["user_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        city: json["city"],
        country: json["country"],
        bio: json["bio"],
        pictureName: json["pictureName"],
        bannerName: json["bannerName"],
        picture: json["picture"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "city": city,
        "country": country,
        "pictureName": pictureName,
        "bannerName": bannerName,
        "bio": bio,
        "genre": List<dynamic>.from(genre!.map((x) => x.toJson())),
        "hobby": List<dynamic>.from(hobby!.map((x) => x.toJson())),
        "discipline": List<dynamic>.from(discipline!.map((x) => x.toJson())),
        "picture": picture,
        "banner": banner,
        "question": question,
        "answer": answer,
      };
}

class Discipline {
  Discipline({
    required this.id,
    required this.userId,
    required this.name,
  });

  Discipline.add({required this.userId, required this.name}) {
    userId = userId;
    name = name;
  }
  int? id;
  int? userId;
  String? name;

  factory Discipline.fromJson(Map<String, dynamic> json) => Discipline(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
      };
}

class Hobby {
  Hobby({
    required this.id,
    required this.userId,
    required this.name,
  });

  Hobby.add({required this.userId, required this.name}) {
    userId = userId;
    name = name;
  }

  int? id;
  int? userId;
  String? name;

  factory Hobby.fromJson(Map<String, dynamic> json) => Hobby(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.userId,
    required this.name,
  });

  Genre.add({required this.userId, required this.name}) {
    userId = userId;
    name = name;
  }

  int? id;
  int? userId;
  String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
      };
}
