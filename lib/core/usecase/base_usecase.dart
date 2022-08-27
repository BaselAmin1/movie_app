import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';

abstract class BaseUseCase<type, Parameters> {
  Future<Either<Failure, type>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  
  @override
  List<Object?> get props => [];
}
