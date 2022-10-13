import 'package:dartz/dartz.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class ZohoRepository {
  Future<Either<Failure, ZohoEntity>> getCheckInTime();
  Future<Either<Failure, ZohoEntity>> getCheckOutTime();
  Future<Either<Failure, ZohoEntity>> postCheckInTime(DateTime time);
  Future<Either<Failure, ZohoEntity>> postCheckOutTime(DateTime time);
}
