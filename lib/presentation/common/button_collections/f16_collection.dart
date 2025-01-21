import 'package:upfront_controls/core/enums/buttons/f16_buttons.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/circle_button.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/circle_solid_button.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/dobber.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/keypad.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/selector_button.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/switch.dart';

class F16Collection {
  static final keypads = [
    F16Keypad(
      topLabel: "T-ILS",
      label: "1",
      cornerLabel: "",
      identifier: F16Buttons.key1.name,
    ),
    F16Keypad(
      topLabel: "ALOW",
      label: "2",
      cornerLabel: "N",
      identifier: F16Buttons.key2.name,
    ),
    F16Keypad(
      topLabel: "",
      label: "3",
      cornerLabel: "",
      identifier: F16Buttons.key3.name,
    ),
    F16Keypad(
      label: "RCL",
      functionButton: true,
      identifier: F16Buttons.rcl.name,
    ),
    F16Keypad(
      topLabel: "STPT",
      label: "4",
      cornerLabel: "W",
      identifier: F16Buttons.key4.name,
    ),
    F16Keypad(
      topLabel: "CRUS",
      label: "5",
      cornerLabel: "",
      identifier: F16Buttons.key5.name,
    ),
    F16Keypad(
      topLabel: "TIME",
      label: "6",
      cornerLabel: "E",
      identifier: F16Buttons.key6.name,
    ),
    F16Keypad(
      label: "ENTR",
      functionButton: true,
      identifier: F16Buttons.entr.name,
    ),
    F16Keypad(
      topLabel: "MARK",
      label: "7",
      cornerLabel: "",
      identifier: F16Buttons.key7.name,
    ),
    F16Keypad(
      topLabel: "FIX",
      label: "8",
      cornerLabel: "S",
      identifier: F16Buttons.key8.name,
    ),
    F16Keypad(
      topLabel: "A-CAL",
      label: "9",
      cornerLabel: "",
      identifier: F16Buttons.key9.name,
    ),
    F16Keypad(
      topLabel: "M-SEL",
      label: "0",
      cornerLabel: "━",
      identifier: F16Buttons.key0.name,
    ),
  ];

  static F16Keypad getKeypad(F16Buttons identifier) {
    return keypads.firstWhere((e) => e.identifier == identifier.name);
  }

  static final circleButtons = [
    F16CircleButton(
      label: "COM",
      secondLabel: "1",
      identifier: F16Buttons.com1.name,
    ),
    F16CircleButton(
      label: "COM",
      secondLabel: "2",
      identifier: F16Buttons.com2.name,
    ),
    F16CircleButton(
      label: "IFF",
      identifier: F16Buttons.iff.name,
    ),
    F16CircleButton(
      label: "LIST",
      identifier: F16Buttons.list.name,
    ),
    F16CircleButton(
      label: "A-A",
      identifier: F16Buttons.aa.name,
    ),
    F16CircleButton(
      label: "A-G",
      identifier: F16Buttons.ag.name,
    ),
  ];

  static F16CircleButton getCircleButton(F16Buttons identifier) {
    return circleButtons.firstWhere((e) => e.identifier == identifier.name);
  }

  static F16Selector getLeftRocker() {
    return F16Selector(
      labelUp: "▲",
      labelDown: "▼",
      upIdentifier: F16Buttons.lRkrUp.name,
      downIdentifier: F16Buttons.lRkrUp.name,
    );
  }

  static F16Dobber getDobber() {
    return F16Dobber(
      leftIdentifier: F16Buttons.aa.name,
      rightIdentifier: F16Buttons.aa.name,
      bottomIdentifier: F16Buttons.aa.name,
      topIdentifier: F16Buttons.aa.name,
    );
  }

  static F16CircleSolidButton getWx() {
    return F16CircleSolidButton(
      label: "WX",
      identifier: F16Buttons.aa.name,
    );
  }

  static F16Selector getRightRocker() {
    return F16Selector(
      labelUp: "▲",
      labelDown: "▼",
      upIdentifier: F16Buttons.aa.name,
      downIdentifier: F16Buttons.aa.name,
    );
  }

  static F16Switch getSwitch() {
    return F16Switch(
      topIdentifier: F16Buttons.aa.name,
      midIdentifier: F16Buttons.aa.name,
      botIdentifier: F16Buttons.aa.name,
    );
  }
}
