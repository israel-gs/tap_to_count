import 'package:get/get.dart';
import 'package:tap_to_count/core/languages/en_us.dart';
import 'package:tap_to_count/core/languages/es_pe.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enUS(), 'es_PE': esPE()};
}
