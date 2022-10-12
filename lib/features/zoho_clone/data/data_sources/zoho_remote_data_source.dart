import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoho_clone/core/errors/exceptions.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class ZohoRemoteDataSource {
   Future<Zoho> getCheckInTime();
   Future<Zoho> getCheckOutTime();
   Future<Zoho> postCheckInTime(DateTime time);
   Future<Zoho> postCheckOutTime(DateTime time);
}

class ZohoRemoteDataSourceImpl implements ZohoRemoteDataSource {
  final http.Client client;
  ZohoRemoteDataSourceImpl({required this.client});
//WEB API KEY :  AIzaSyCHawrAJrOjht1aoXQqRMM5p-9JFawuOzE


  @override
  Future<ZohoModel> getCheckInTime() => _getCheckInCheckOutFromURL(
      "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json");

  @override
  Future<ZohoModel> getCheckOutTime() => _getCheckInCheckOutFromURL(
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

  Future<ZohoModel> _postCheckInCheckOutFromURL(String url) async {
    await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          "checkInTime": DateTime.now(),
          "checkOutTime": DateTime.now(),
        },
      ),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    throw ServerExceptions();
  }

  @override
  Future<Zoho> postCheckInTime(DateTime time) => _postCheckInCheckOutFromURL(
      "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json");

  @override
  Future<Zoho> postCheckOutTime(DateTime time) => _postCheckInCheckOutFromURL(
      "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json");

  // @override
  // Future<Zoho> postCheckOutTime(DateTime time) {
  //   http.post(
  //     Uri.parse(
  //         "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkOutTime.json"),
  //     body: jsonEncode(
  //       {
  //         "checkInTime": DateTime.now(),
  //         "checkOutTime": DateTime.now(),
  //       },
  //     ),
  //     headers: <String, String>{'Content-Type': 'application/json'},
  //   );

  //   throw UnimplementedError();
  // }

    CollectionReference time = FirebaseFirestore.instance.collection('checkIn');
  Future<void> addCheckInTime(time) {
    return time
        .add(
          {
            "checkIn": "October 22, 2022 at 12:45:30",
          },
        )
        .then((value) => print("time added"))
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }
}
