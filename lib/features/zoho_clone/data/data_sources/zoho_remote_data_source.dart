import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class ZohoRemoteDataSource {
  Future<ZohoEntity> getCheckInTime();
  Future<ZohoEntity> getCheckOutTime();
  postCheckInTime(DateTime time);
  postCheckOutTime(DateTime time);
}

class ZohoRemoteDataSourceImpl implements ZohoRemoteDataSource {
  final http.Client client;
  ZohoRemoteDataSourceImpl({required this.client});
//WEB API KEY :  AIzaSyCHawrAJrOjht1aoXQqRMM5p-9JFawuOzE

//* GET GET GET

  @override
  Future<ZohoModel> getCheckInTime() =>
      _getCheckInCheckOutFromCollection("checkIn");

  @override
  Future<ZohoModel> getCheckOutTime() =>
      _getCheckInCheckOutFromCollection("checkOut");
//get
  Future<ZohoModel> _getCheckInCheckOutFromCollection(
      String collectionName) async {
    var response =
        await FirebaseFirestore.instance.collection(collectionName).get();
    response.docs;
    // .map((snapshot) =>
    //        snapshot.docs.map((doc) => ZohoModel.fromJson(doc.data())).toList());
    return response.docs as Future<ZohoModel>;

    // final response = await client.get(Uri.parse(Collection), headers: {
    //   'Content-Type': 'application/json',
    // });
    // if (response.statusCode == 200) {
    //   print(
    //       "zohomodel fromjson jsondecode responsebody: ${ZohoModel.fromJson(json.decode(response.body))}");
    //   return ZohoModel.fromJson(json.decode(response.body));
  }

// List<ZohoModel> getCheckOutHistory() {
//   var response = FirebaseFirestore.instance
//       .collection("checkOut")
//       .snapshots()
//       .map((snapshot) =>
//           snapshot.docs.map((doc) => ZohoModel.fromJson(doc.data())).toList());

//   return response as List<ZohoModel>;
// }

//* POST POST POST

  @override
  Future<ZohoEntity> postCheckInTime(DateTime time) =>
      postCheckInTimee("checkIn", time) as Future<ZohoEntity>;

  @override
  Future<ZohoEntity> postCheckOutTime(DateTime time) =>
      postCheckInTimee("checkOut", time) as Future<ZohoEntity>;

  Future postCheckInTimee(String collectionName, DateTime time) async {
    CollectionReference docTime =
        FirebaseFirestore.instance.collection(collectionName);

    // final zohotime = ZohoEntity(time: time);

    final json = {
      collectionName: time,
    };
    await docTime.add(json);
  }

  // Future<ZohoModel> _postCheckInCheckOutFromURL(String url) async {
  //   await http.post(
  //     Uri.parse(url),
  //     body: jsonEncode(
  //       {
  //         "checkInTime": DateTime.now(),
  //         "checkOutTime": DateTime.now(),
  //       },
  //     ),
  //     headers: <String, String>{'Content-Type': 'application/json'},
  //   );
  //   throw ServerExceptions();
  // }

  // @override
  // Future<ZohoEntity> postCheckInTime(DateTime time) =>
  //     _postCheckInCheckOutFromURL(
  //         "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json");

  // @override
  // Future<ZohoEntity> postCheckOutTime(DateTime time) =>
  //     _postCheckInCheckOutFromURL(
  //         "https://zohoclone-2c0df-default-rtdb.firebaseio.com/checkInTime.json");
}

//!
//*

// Future<ZohoEntity> postCheckInTime(DateTime time)=>
// postCheckInTimee("checkIn", time) as Future<ZohoEntity>;

// Future<ZohoEntity> postCheckOutTime(DateTime time)=>
// postCheckInTimee("checkOut", time) as Future<ZohoEntity>;

// Future postCheckInTimee(String collectionName, DateTime time) async {

//   CollectionReference docTime =
//       FirebaseFirestore.instance.collection(collectionName);

//   final zohotime = ZohoEntity(time: time);

//   final json = {
//     collectionName: time,
//   };
//   await docTime.add(json);
// }

// Future postCheckOutTimee(DateTime time) async {
//   final collectionName;

//   CollectionReference docTime =
//       FirebaseFirestore.instance.collection('checkOut');

//   final zohotime = ZohoEntity(time: time);

//   final json = {
//     "checkOut": time,
//   };
//   await docTime.add(json);
// }
//*
//!

// Future<void> addCheckInTime(time) {
//     return time
//         .add(
//           {
//             "checkIn": "October 22, 2022 at 12:45:30",
//           },
//         )
//         .then((value) => print("time added"))
//         .catchError(
//           (error) => print("Failed to add user: $error"),
//         );
//   }

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
