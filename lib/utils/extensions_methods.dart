import 'package:brasil_fields/brasil_fields.dart';

extension StringExtension on String {
  String removeSpecialCharacters() {
    return replaceAll(RegExp(r'(\W+)'), '');
  }

  String? formatDocument() {
    if (isValidDocument() == false) return null;
    return length == 11
        ? UtilBrasilFields.obterCpf(this)
        : UtilBrasilFields.obterCnpj(this);
  }

  String? formatPhone() {
    if (isEmpty) return null;
    return UtilBrasilFields.obterTelefone(this);
  }

  String? formatCep() {
    if (isEmpty) return null;
    return UtilBrasilFields.obterCep(this);
  }

  bool isValidDocument() {
    if (isEmpty) return false;
    return length == 11
        ? UtilBrasilFields.isCPFValido(this)
        : UtilBrasilFields.isCNPJValido(this);
  }

  bool get isEmail {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  String removeDiacritics() {
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    String text = this;
    for (int i = 0; i < withDia.length; i++) {
      text = text.replaceAll(withDia[i], withoutDia[i]);
    }

    return text;
  }
}
