import 'package:upfront_controls/core/enums/airframes.dart';
import 'package:upfront_controls/data/entities/keybind.dart';

class ButtonGroup {
  final Airframe airframe;
  final List<Keybind> keybinds;

  const ButtonGroup({required this.airframe, required this.keybinds});

  Map<String, dynamic> toJson() => {
        'airframe': airframe.name,
        'keybinds': keybinds.map((k) => k.toJson()).toList(),
      };

  factory ButtonGroup.fromJson(Map<String, dynamic> json) => ButtonGroup(
        airframe: Airframe.values.firstWhere(
          (e) => e.name == json['airframe'],
        ),
        keybinds:
            (json['keybinds'] as List).map((k) => Keybind.fromJson(k)).toList(),
      );

  Keybind getKeybind(String identifier) {
    return keybinds.firstWhere(
      (e) => e.identifier == identifier,
    );
  }
}
