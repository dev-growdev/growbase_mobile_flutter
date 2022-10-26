class User {
  final String uid;
  final String name;
  final String email;
  final String? document;
  User({
    required this.uid,
    required this.name,
    required this.email,
    this.document,
  });

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? document,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      document: document ?? this.document,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'email': email});
    if (document != null) {
      result.addAll({'document': document});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      document: map['document'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.document == document;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ email.hashCode ^ document.hashCode;
  }
}
