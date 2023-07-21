import 'package:growbase_mobile_flutter/shared/entities/user.entity.dart';
import 'package:growbase_mobile_flutter/shared/entities/user_auth.entity.dart';

import 'user.entity.builder.dart';

class UserAuthBuilder {
  final String _token = 'any_token';
  final User _user = UserBuilder.init().build();

  static UserAuthBuilder init() => UserAuthBuilder();

  UserAuth build() {
    return UserAuth(
      user: _user,
      token: _token,
    );
  }
}
