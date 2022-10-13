import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';

Future<List<ZohoModel>> getCheckInHistory() async {
  var response = await FirebaseFirestore.instance.collection("checkIn").get();
  List<ZohoModel> times = [];
  var ans = response.docs.map((e) => ZohoModel.fromJson(e.data())).toList();
  ans.forEach((doc) {
    times.add(doc);
  });
  return times;
}

Future<List<ZohoModelOUT>> getCheckOutHistory() async {
  var response = await FirebaseFirestore.instance.collection("checkOut").get();

  List<ZohoModelOUT> times = [];
  var ans = response.docs.map((e) => ZohoModelOUT.fromJson(e.data())).toList();
  ans.forEach((doc) {
    times.add(doc);
  });
  return times;
}
