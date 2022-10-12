import 'package:zoho_clone/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';
import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';

class PostCheckOutTimeUsecase {
  final ZohoRepository repository;

  PostCheckOutTimeUsecase(this.repository);

  Future<Either<Failure, Zoho>> execute(DateTime time) async {
    return await repository.postCheckOutTime(time);
  }
}
