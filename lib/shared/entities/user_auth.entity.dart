import 'user.entity.dart';

class UserAuth {
  final String token;
  final User user;

  const UserAuth({
    required this.token,
    required this.user,
  });

  factory UserAuth.fromMap(Map<String, dynamic> map) {
    return UserAuth(
      token: map['token'] ?? '',
      user: User.fromMap(map['user']),
    );
  }

  @override
  bool operator ==(covariant UserAuth other) {
    if (identical(this, other)) return true;

    return other.token == token && other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
