import 'package:dartz/dartz.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho_entity.dart';

abstract class ZohoRepository {
  Future<Either<Failure, ZohoEntity>> getCheckInTime();
  Future<Either<Failure, ZohoEntity>> getCheckOutTime();
  Future<Either<Failure, ZohoEntity>> postCheckInTime(String time);
  Future<Either<Failure, ZohoEntity>> postCheckOutTime(String time);
}
