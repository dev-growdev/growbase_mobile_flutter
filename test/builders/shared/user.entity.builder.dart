import 'package:growbase_mobile_flutter/shared/entities/user.entity.dart';

class UserBuilder {
  final String _uid = 'any_uid';
  final String _name = 'any_name';
  final String _email = 'any_email';
  final String _document = 'any_document';

  static UserBuilder init() => UserBuilder();

  User build() {
    return User(
      uid: _uid,
      name: _name,
      email: _email,
      document: _document,
    );
  }
}
