import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upfront_controls/core/preset.dart';
import 'package:upfront_controls/core/constants/settings.dart';
import 'package:upfront_controls/core/constants/local_keys.dart';
import 'package:upfront_controls/data/entities/button_group.dart';
import 'package:upfront_controls/data/entities/presets.dart';
import 'package:upfront_controls/data/entities/settings.dart';

class LocalDatasource {
  static Future<Settings> fetchSettings() async {
    final localStorage = await SharedPreferences.getInstance();

    final json = localStorage.getString(LocalKeys.localSettingsKey);

    if (json == null) return DefaultSettings.value;

    return Settings.fromJson(jsonDecode(json));
  }

  static Future<void> saveSettings(Settings settings) async {
    final localStorage = await SharedPreferences.getInstance();

    final json = settings.toJson();

    localStorage.setString(
      LocalKeys.localSettingsKey,
      jsonEncode(json),
    );
  }

  static Future<Presets> fetchAllPresets() async {
    final localStorage = await SharedPreferences.getInstance();

    final json = localStorage.getString(LocalKeys.localPresetsKey);

    if (json == null) return DefaultPreset.value;

    return Presets.fromJson(jsonDecode(json));
  }

  static void savePresets(ButtonGroup buttonGroup) async {
    final localStorage = await SharedPreferences.getInstance();
    final json = localStorage.getString(LocalKeys.localPresetsKey);

    final toSave = _replaceExistingEntry(
      json: json,
      buttonGroup: buttonGroup,
    );

    localStorage.setString(
      LocalKeys.localPresetsKey,
      jsonEncode(toSave.toJson()),
    );
  }

  static Presets _replaceExistingEntry({
    required String? json,
    required ButtonGroup buttonGroup,
  }) {
    if (json == null) return Presets(buttonGroups: [buttonGroup]);

    final local = Presets.fromJson(jsonDecode(json));
    final index = local.buttonGroups.indexWhere(
      (e) => e.airframe == buttonGroup.airframe,
    );

    if (index == -1) {
      local.buttonGroups.add(buttonGroup);
    } else {
      local.buttonGroups[index] = buttonGroup;
    }

    return local;
  }
}
