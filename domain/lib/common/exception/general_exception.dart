import 'commerce_exception.dart';

class GeneralException implements CommerceException {
  @override
  String get message => "error try again later";
}
