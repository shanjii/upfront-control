import 'package:upfront_controls/core/enums/airframes.dart';
import 'package:upfront_controls/core/enums/buttons/f16_buttons.dart';
import 'package:upfront_controls/core/enums/buttons/f18_buttons.dart';
import 'package:upfront_controls/data/entities/button_group.dart';
import 'package:upfront_controls/data/entities/keybind.dart';
import 'package:upfront_controls/data/entities/presets.dart';

class DefaultPreset {
  static final value = Presets(
    buttonGroups: [
      _f16Group,
      _f18Group,
    ],
  );

  static final _f16Group = ButtonGroup(
    airframe: Airframe.f16,
    keybinds: [
      for (int i = 0; i < F16Buttons.values.length; i++)
        Keybind(
          identifier: F16Buttons.values[i].name,
          keyboardKey: '',
          vJoyKey: i,
          modifier: '',
        ),
    ],
  );

  static final _f18Group = ButtonGroup(
    airframe: Airframe.f18,
    keybinds: [
      for (int i = 0; i < F18Buttons.values.length; i++)
        Keybind(
          identifier: F18Buttons.values[i].name,
          keyboardKey: '',
          vJoyKey: i,
          modifier: '',
        ),
    ],
  );
}
