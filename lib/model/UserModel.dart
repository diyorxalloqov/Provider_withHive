import 'package:hive/hive.dart';
import 'dart:convert';
part 'UserModel.g.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;
  @HiveField(4)
  Address address;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String website;
  @HiveField(7)
  Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

@HiveType(typeId: 1)
class Address {
  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

@HiveType(typeId: 2)
class Geo {
  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

@HiveType(typeId: 3)
class Company {
  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
