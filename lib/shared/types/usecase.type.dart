import 'package:agmais_mobile/shared/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';

typedef UseCase<Type> = Future<Either<Failure, Type>>;
