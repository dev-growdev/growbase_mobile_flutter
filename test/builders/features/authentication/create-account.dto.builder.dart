import 'package:growbase_mobile_flutter/features/authentication/dtos/create-account.dto.dart';

class CreateAccountDTOBuilder {
  final String _name = 'any_name';
  final String _email = 'any_email';
  final String _document = 'any_document';
  final String _password = 'any_pass';

  static CreateAccountDTOBuilder init() => CreateAccountDTOBuilder();

  CreateAccountDTO build() {
    return CreateAccountDTO(
      name: _name,
      email: _email,
      document: _document,
      password: _password,
    );
  }
}
