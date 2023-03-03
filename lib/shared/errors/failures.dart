// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../dtos/invalid_field.dto.dart';

abstract class Failure {
  String message;
  Failure(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.message == message;
  }

  // coverage:ignore-start
  @override
  int get hashCode => message.hashCode;
  // coverage:ignore-end
}

class AdapterFailure extends Failure {
  AdapterFailure(String message) : super(message);
}

class BadRequestFailure extends Failure {
  List<InvalidFieldDto>? invalidFields;

  BadRequestFailure(String message, [this.invalidFields]) : super(message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BadRequestFailure &&
        listEquals(other.invalidFields, invalidFields);
  }

  // coverage:ignore-start
  @override
  int get hashCode => invalidFields.hashCode;
  // coverage:ignore-end

  @override
  String toString() => 'BadRequestFailure(invalidFields: $invalidFields)';
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(String message) : super(message);
}

class UserNotVerifiedFailure extends Failure {
  UserNotVerifiedFailure(String message) : super(message);
}
