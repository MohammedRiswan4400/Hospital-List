// To parse this JSON data, do
//
//     final hospitals = hospitalsFromJson(jsonString);

import 'dart:convert';

Hospitals hospitalsFromJson(String str) => Hospitals.fromJson(json.decode(str));

String hospitalsToJson(Hospitals data) => json.encode(data.toJson());

class Hospitals {
  String response;
  String message;
  List<Getdatum> getdata;
  String imageurl;

  Hospitals({
    required this.response,
    required this.message,
    required this.getdata,
    required this.imageurl,
  });

  factory Hospitals.fromJson(Map<String, dynamic> json) => Hospitals(
        response: json["response"],
        message: json["message"],
        getdata: List<Getdatum>.from(
            json["getdata"].map((x) => Getdatum.fromJson(x))),
        imageurl: json["imageurl"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": message,
        "getdata": List<dynamic>.from(getdata.map((x) => x.toJson())),
        "imageurl": imageurl,
      };
}

class Getdatum {
  String id;
  String hospitalid;
  String hospitalname;
  String abouthospital;
  String hospitalfeatures;
  String hospitaladdress;
  String state;
  String city;
  String district;
  String taluk;
  String pincode;
  String primaryContactno;
  String secondaryContactno;
  String mobileno;
  String hospitalimage;
  List<Offer> offerdata;

  Getdatum({
    required this.id,
    required this.hospitalid,
    required this.hospitalname,
    required this.abouthospital,
    required this.hospitalfeatures,
    required this.hospitaladdress,
    required this.state,
    required this.city,
    required this.district,
    required this.taluk,
    required this.pincode,
    required this.primaryContactno,
    required this.secondaryContactno,
    required this.mobileno,
    required this.hospitalimage,
    required this.offerdata,
  });

  factory Getdatum.fromJson(Map<String, dynamic> json) => Getdatum(
        id: json["id"],
        hospitalid: json["hospitalid"],
        hospitalname: json["hospitalname"],
        abouthospital: json["abouthospital"],
        hospitalfeatures: json["hospitalfeatures"],
        hospitaladdress: json["hospitaladdress"],
        state: json["state"],
        city: json["city"],
        district: json["district"],
        taluk: json["taluk"],
        pincode: json["pincode"],
        primaryContactno: json["primary_contactno"],
        secondaryContactno: json["secondary_contactno"],
        mobileno: json["mobileno"],
        hospitalimage: json["hospitalimage"],
        offerdata:
            List<Offer>.from(json["offerdata"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospitalid": hospitalid,
        "hospitalname": hospitalname,
        "abouthospital": abouthospital,
        "hospitalfeatures": hospitalfeatures,
        "hospitaladdress": hospitaladdress,
        "state": state,
        "city": city,
        "district": district,
        "taluk": taluk,
        "pincode": pincode,
        "primary_contactno": primaryContactno,
        "secondary_contactno": secondaryContactno,
        "mobileno": mobileno,
        "hospitalimage": hospitalimage,
        "offerdata": List<dynamic>.from(offerdata.map((x) => x.toJson())),
      };
}

class Offer {
  String title;
  String percentage;

  Offer({
    required this.title,
    required this.percentage,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        title: json["title"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "percentage": percentage,
      };
}
