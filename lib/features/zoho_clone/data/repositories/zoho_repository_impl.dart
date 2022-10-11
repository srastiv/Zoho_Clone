// import 'package:zoho_clone/core/errors/failures.dart';
// import 'package:dartz/dartz.dart';
// import 'package:zoho_clone/features/zoho_clone/data/data_sources/zoho_remote_data_source.dart';
// import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';
// import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';

// class ZohoRepositoryImpl implements ZohoRepository {
//   final ZohoRemoteDataSource remoteDataSource;
//   ZohoRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, Zoho>> getCheckInCheckOutTime(DateTime time) async {
//     return await getTime(()=>remoteDataSource.getCheckInCheckOutTime(time));
//   }

//   Future<Either<Failure, Zoho>> getTime(
//      Future<Zoho> getTime) async {
   
//   }
// }
