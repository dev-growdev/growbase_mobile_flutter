import 'package:growbase_mobile_flutter/shared/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';

typedef Repository<Type> = Future<Either<Failure, Type>>;
