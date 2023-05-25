import 'dart:convert';

Adddress addressFromJson(String str) => Adddress.fromJson(json.decode(str));

String addressToJson(Adddress data) => json.encode(data.toJson());

class Adddress{
  String? id;
  String? belongsTo;
  String fullName;
  String state;
  String district;
  String city;
  String phoneNumber;
  String address1;
  String? address2;
  String? extraDetails;

  Adddress({
    this.id,
     this.belongsTo,
    required this.fullName,
    required this.state,
    required this.district,
    required this.city,
    required this.phoneNumber,
    required this.address1,
    this.address2,
    this.extraDetails,
  });

  factory Adddress.fromJson(Map<String, dynamic> json) => Adddress(
        id: json["_id"],
        belongsTo: json["belongsTo"],
        fullName: json["fullName"],
        state: json["State"],
        district: json["Distric"],
        city: json["City"],
        phoneNumber: json["PhoneNumber"],
        address1: json["Address1"],
        address2: json["Address2"],
        extraDetails: json["extraDetails"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "belongsTo": belongsTo,
        "fullName": fullName,
        "State": state,
        "Distric": district,
        "City": city,
        "PhoneNumber": phoneNumber,
        "Address1": address1,
        "Address2": address2,
        "extraDetails": extraDetails,
      };
}
