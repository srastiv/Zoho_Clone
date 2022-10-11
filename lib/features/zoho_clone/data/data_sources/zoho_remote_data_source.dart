import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:zoho_clone/core/errors/exceptions.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class ZohoRemoteDataSource {
  Future<Zoho> getCheckInCheckOutTime(DateTime time);
}

class ZohoRemoteDataSourceImpl implements ZohoRemoteDataSource {
  final http.Client client;
  ZohoRemoteDataSourceImpl({required this.client});

  @override
  Future<ZohoModel> getCheckInCheckOutTime(DateTime time) => _getCheckInCheckOutFromURL("ff");
  
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
  //TODO: post
}
