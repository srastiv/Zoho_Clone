import 'package:zoho_clone/core/errors/exceptions.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:zoho_clone/features/zoho_clone/data/data_sources/zoho_remote_data_source.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';
import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';

typedef _getTheTime = Future<Zoho> Function();

class ZohoRepositoryImpl implements ZohoRepository {
  final ZohoRemoteDataSource remoteDataSource;
  ZohoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Zoho>> getCheckInTime() async {
    try {
      final getCheckInTime = await remoteDataSource.getCheckInTime();
      return Right(getCheckInTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Zoho>> getCheckOutTime() async {
    try {
      final getCheckOutTime = await remoteDataSource.getCheckOutTime();
      return Right(getCheckOutTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Zoho>> postCheckInTime(DateTime time) async {
    try {
      final postCheckInTime = await remoteDataSource.postCheckInTime(time);
      return Right(postCheckInTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Zoho>> postCheckOutTime(DateTime time) async {
    try {
      final postCheckOutTime = await remoteDataSource.postCheckOutTime(time);
      return Right(postCheckOutTime);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }
}
