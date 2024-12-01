import 'commerce_exception.dart';

class GeneralException implements CommerceException {
  @override
  String get message => "error_try_again_later";
}
