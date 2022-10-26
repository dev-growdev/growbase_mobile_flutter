class Category {
  final String uid;
  final String name;
  final String description;

  const Category({
    required this.uid,
    required this.name,
    required this.description,
  });

  const Category.empty({
    this.uid = '',
    this.name = '',
    this.description = '',
  });

  Category copyWith({
    String? uid,
    String? name,
    String? description,
  }) {
    return Category(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({
      'image': {'url': 'aaaaa'}
    });

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.uid == uid &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ description.hashCode;
}
