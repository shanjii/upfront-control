import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

class ScreenTimer {
  bool initialized = false;
  late RestartableTimer timer;
  ValueNotifier<bool> sleep = ValueNotifier(false);

  init() {
    timer = RestartableTimer(
      Duration(seconds: 10),
      () => _sleepScreen(),
    );
    initialized = true;
  }

  reset() {
    if (!initialized) return;
    sleep.value = false;
    timer.reset();
  }

  cancel() {
    if (!initialized) return;
    timer.cancel();
  }

  _sleepScreen() {
    sleep.value = true;
  }
}
