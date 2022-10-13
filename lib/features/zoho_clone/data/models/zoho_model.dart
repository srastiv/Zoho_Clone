
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

class ZohoModel extends ZohoEntity {
  ZohoModel({
    required this.checkIn,
  }) : super(time: DateTime.now().toString());

  final String checkIn;

  factory ZohoModel.fromRawJson(String str) =>
      ZohoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  
  factory ZohoModel.fromJson(Map<String, dynamic> json) => ZohoModel(
        checkIn: json["checkIn"],
      );
      

  Map<String, dynamic> toJson() => {
        "checkIn": checkIn,
      };
     
}

class ZohoModelOUT extends ZohoEntity{
    ZohoModelOUT({
        required this.checkOut,
    }): super(time: DateTime.now().toString());

    final String checkOut;

    factory ZohoModelOUT.fromRawJson(String str) => ZohoModelOUT.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ZohoModelOUT.fromJson(Map<String, dynamic> json) => ZohoModelOUT(
      
        checkOut: json["checkOut"],
    );

    Map<String, dynamic> toJson() => {
       
        "checkOut": checkOut,
    };
}
