class User {
  final String uid;
  final String name;
  final String email;
  final String? document;
  final String? phone;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    this.document,
    this.phone,
  });

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? document,
    String? phone,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      document: document ?? this.document,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    if (document != null) {
      result.addAll({'document': document});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      document: map['document'],
      phone: map['phone'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.document == document &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        document.hashCode ^
        phone.hashCode;
  }
}
