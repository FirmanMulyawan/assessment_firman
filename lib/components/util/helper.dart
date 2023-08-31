// matching various patterns for kinds of data
import 'package:get/get.dart';

class Validator {
  Validator();

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Data tidak boleh kosong';
    } else {
      return null;
    }
  }
}
