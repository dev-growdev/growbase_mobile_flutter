import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../dtos/invalid_field.dto.dart';
import '../errors/failures.dart';

Future<Either<Failure, T>> makeRequest<T>(Future<T> Function() func) async {
  try {
    final T result = await func();
    return Right(result);
  } on DioError catch (err) {
    final int? statusCode = err.response?.statusCode;
    final Map<String, dynamic> error = err.response?.data['error'];
    final String message = error['message'];

    if (statusCode == 400) {
      final invalidFields = (error['details'] as List)
          .map((d) => InvalidFieldDto.fromMap(d))
          .toList();

      return Left(BadRequestFailure(message, invalidFields));
    }

    if (statusCode == 404) {
      return Left(NotFoundFailure(message));
    }

    if (statusCode == 401) {
      return Left(UnauthorizedFailure(message));
    }

    if (message.contains('Usuário não verificado')) {
      return Left(UserNotVerifiedFailure(message));
    }

    return Left(ServerFailure(message));
  }
}
