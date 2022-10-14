import 'package:zoho_clone/core/errors/exceptions.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:zoho_clone/features/zoho_clone/data/data_sources/zoho_remote_data_source.dart';
import 'package:zoho_clone/features/zoho_clone/data/models/zoho_model.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho_entity.dart';
import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';

//typedef _getTheTime = Future<Zoho> Function();

class ZohoRepositoryImpl implements ZohoRepository {
  final ZohoRemoteDataSource remoteDataSource;
  ZohoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ZohoEntity>> getCheckInTime() async {
    try {
      final getCheckInTime = await remoteDataSource.getCheckInTime();
      return Right(getCheckInTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ZohoEntity>> getCheckOutTime() async {
    try {
      final getCheckOutTime = await remoteDataSource.getCheckOutTime();
      return Right(getCheckOutTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ZohoEntity>> postCheckInTime(String time) async {
  //  print(await " remoteDataSource.postCheckInTime: ${remoteDataSource.postCheckInTime(time)}");
    try {
      final postCheckInTime = await remoteDataSource.postCheckInTime(time);
      return Right(postCheckInTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ZohoEntity>> postCheckOutTime(String time) async {
    try {
      final postCheckOutTime = await remoteDataSource.postCheckOutTime(time);
      return Right(postCheckOutTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }
}
