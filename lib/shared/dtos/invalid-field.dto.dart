class InvalidFieldDto {
  String field;
  String message;
  InvalidFieldDto({
    required this.field,
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InvalidFieldDto &&
        other.field == field &&
        other.message == message;
  }

  // coverage:ignore-start
  @override
  int get hashCode => field.hashCode ^ message.hashCode;
  // coverage:ignore-end

  factory InvalidFieldDto.fromMap(Map<String, dynamic> map) {
    return InvalidFieldDto(
      field: map['field'] ?? '',
      message: map['message'] ?? '',
    );
  }

  @override
  String toString() => 'InvalidFieldDto(field: $field, message: $message)';
}
