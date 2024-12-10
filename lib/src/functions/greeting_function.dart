import 'package:smart_localize/smart_localize.dart';

String get greeting {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return SmartLocalize.goodMorning;
  }
  if (hour < 17) {
    return SmartLocalize.goodAfternoon;
  }
  return SmartLocalize.goodEvening;
}
