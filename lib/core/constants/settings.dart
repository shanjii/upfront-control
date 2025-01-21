import 'package:upfront_controls/core/enums/feedbacks.dart';
import 'package:upfront_controls/data/entities/settings.dart';

class DefaultSettings {
  static const value = Settings(
    sleep: false,
    vJoyMode: false,
    maximize: false,
    haptics: HapticType.off,
    ip: '',
    port: '',
  );
}
