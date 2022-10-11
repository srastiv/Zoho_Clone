import 'package:dartz/dartz.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class ZohoRepository {
  Future<Either<Failure, Zoho>> getCheckInTime(DateTime time);
  Future<Either<Failure, Zoho>> getCheckOutTime(DateTime time);
  Future<Either<Failure, Zoho>> postCheckInTime(DateTime time);
  Future<Either<Failure, Zoho>> postCheckOutTime(DateTime time);
}
