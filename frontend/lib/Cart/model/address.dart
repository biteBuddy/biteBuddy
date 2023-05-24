import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
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

  Address({
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
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
