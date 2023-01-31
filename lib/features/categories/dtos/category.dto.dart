class CategoryDTO {
  final String name;
  final String description;

  CategoryDTO({
    this.name = '',
    this.description = '',
  });

  CategoryDTO copyWith({
    String? name,
    String? description,
  }) {
    return CategoryDTO(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({
      'image': {'url': 'aaaaa'}
    });

    return result;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryDTO &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode;
}
