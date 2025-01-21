import 'package:flutter/material.dart';
import 'package:upfront_controls/core/enums/feedbacks.dart';
import 'package:upfront_controls/data/datasources/local/local_datasource.dart';
import 'package:upfront_controls/main.dart';
import 'package:upfront_controls/core/haptics.dart';

class SettingsController extends ChangeNotifier {
  bool vJoyMode = kSettings.vJoyMode;
  bool maximize = kSettings.maximize;
  HapticType haptics = kSettings.haptics;
  bool sleep = kSettings.sleep;
  String ip = kSettings.ip;
  String port = kSettings.port;

  bool hasChanges = false;

  void verifyChanges() {
    hasChanges = vJoyMode != kSettings.vJoyMode ||
        haptics != kSettings.haptics ||
        maximize != kSettings.maximize ||
        sleep != kSettings.sleep ||
        ip != kSettings.ip ||
        port != kSettings.port;

    notifyListeners();
  }

  void setVjoy(bool value) {
    vJoyMode = value;
    Haptics.vibrate(HapticType.medium);
    verifyChanges();
  }

  void setMaximize(bool value) {
    maximize = value;
    Haptics.vibrate(HapticType.medium);
    verifyChanges();
  }

  void setHaptics(HapticType value) {
    haptics = value;
    Haptics.vibrate(haptics);
    verifyChanges();
  }

  void setSleep(bool value) {
    sleep = value;
    Haptics.vibrate(HapticType.medium);
    verifyChanges();
  }

  void setIp(String value) {
    ip = value;
    verifyChanges();
  }

  void setPort(String value) {
    port = value;
    verifyChanges();
  }

  void saveSettings() {
    final updatedSettings = kSettings.copyWith(
      sleep: sleep,
      haptics: haptics,
      maximize: maximize,
      vJoyMode: vJoyMode,
      ip: ip,
      port: port,
    );

    kSettings = updatedSettings;

    LocalDatasource.saveSettings(updatedSettings);
    Haptics.vibrate(HapticType.heavy);
  }
}
