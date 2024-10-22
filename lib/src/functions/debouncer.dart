import 'dart:async';
import 'dart:ui';

Timer? timer;

void runDebouncer(VoidCallback action, {int milliseconds = 800}) {
  timer?.cancel();

  timer = Timer(Duration(milliseconds: milliseconds), action);
}
