import 'package:flutter/services.dart';
import 'package:upfront_controls/core/enums/feedbacks.dart';

class Haptics {
  static void vibrate(HapticType haptic) {
    switch (haptic) {
      case HapticType.off:
        break;
      case HapticType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticType.heavy:
        HapticFeedback.heavyImpact();
        break;
    }
  }
}
