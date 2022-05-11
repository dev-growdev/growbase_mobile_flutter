import 'package:agmais_mobile/shared/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';

typedef Repository<Type> = Future<Either<Failure, Type>>;
