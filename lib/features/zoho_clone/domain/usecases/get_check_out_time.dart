import 'package:equatable/equatable.dart';
import 'package:zoho_clone/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:zoho_clone/core/usecases/usecase.dart';
import 'package:zoho_clone/features/zoho_clone/domain/entities/zoho.dart';
import 'package:zoho_clone/features/zoho_clone/domain/repositories/zoho_repository.dart';

class GetCheckInCheckOutTime implements Usecase<Zoho, Params> {
  final ZohoRepository repository;

  GetCheckInCheckOutTime(this.repository);

  @override
  Future<Either<Failure, Zoho>> call(Params params) async {
    return await repository.getCheckOutTime(params.time);
  }
}

class Params extends Equatable {
  final DateTime time;
  Params({required this.time}) : super(); //super([time]);

  @override
  List<Object?> get props => throw UnimplementedError();
}
