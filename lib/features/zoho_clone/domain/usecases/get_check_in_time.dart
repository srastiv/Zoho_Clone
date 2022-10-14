import 'package:zoho_clone/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho_entity.dart';
import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';

class GetCheckInTimeUsecase {
  final ZohoRepository repository;

  GetCheckInTimeUsecase(this.repository);

  Future<Either<Failure, ZohoEntity>> execute() async {
    return await repository.getCheckInTime();
  }
}
