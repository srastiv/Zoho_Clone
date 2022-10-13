import 'package:dartz/dartz.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, ZohoEntity>> call(Params params);
}
