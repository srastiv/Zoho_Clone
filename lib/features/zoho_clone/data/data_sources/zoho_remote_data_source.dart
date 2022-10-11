import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:zoho_clone/core/errors/exceptions.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class ZohoRemoteDataSource {
  Future<Zoho> getCheckInTime(DateTime time);
  Future<Zoho> getCheckOutTime(DateTime time);
  Future<Zoho> postCheckInTime(DateTime time);
  Future<Zoho> postCheckOutTime(DateTime time);
}

class ZohoRemoteDataSourceImpl implements ZohoRemoteDataSource {
  final http.Client client;
  ZohoRemoteDataSourceImpl({required this.client});

//WEB API KEY :  AIzaSyCHawrAJrOjht1aoXQqRMM5p-9JFawuOzE

  @override
  Future<ZohoModel> getCheckInTime(DateTime time) => _getCheckInCheckOutFromURL(
      "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json");
  Future<ZohoModel> getCheckOutTime(DateTime time) => _getCheckInCheckOutFromURL(
      "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkOutTime.json");

//get
  Future<ZohoModel> _getCheckInCheckOutFromURL(String url) async {
    final response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return ZohoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<Zoho> postCheckInTime(DateTime time) {
    http.post(
      Uri.parse(
          "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json"),
      body: jsonEncode(
        {
          "checkInTime": DateTime.now(),
          "checkOutTime": DateTime.now(),
        },
      ),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    throw UnimplementedError();
  }

  @override
  Future<Zoho> postCheckOutTime(DateTime time) {
    http.post(
      Uri.parse(
          "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkOutTime.json"),
      body: jsonEncode(
        {
          "checkInTime": DateTime.now(),
          "checkOutTime": DateTime.now(),
        },
      ),
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    throw UnimplementedError();
  }
}
