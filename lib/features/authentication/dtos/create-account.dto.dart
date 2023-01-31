class CreateAccountDTO {
  final String name;
  final String email;
  final String document;
  final String password;

  const CreateAccountDTO({
    this.name = '',
    this.email = '',
    this.document = '',
    this.password = '',
  });

  CreateAccountDTO copyWith({
    String? name,
    String? email,
    String? document,
    String? password,
  }) {
    return CreateAccountDTO(
      name: name ?? this.name,
      email: email ?? this.email,
      document: document ?? this.document,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'document': document});
    result.addAll({'password': password});

    return result;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateAccountDTO &&
        other.name == name &&
        other.email == email &&
        other.document == document &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        document.hashCode ^
        password.hashCode;
  }
}
