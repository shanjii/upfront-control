import 'package:upfront_controls/core/enums/airframes.dart';
import 'package:upfront_controls/data/entities/button_group.dart';

class Presets {
  final List<ButtonGroup> buttonGroups;

  const Presets({required this.buttonGroups});

  factory Presets.fromJson(Map<String, dynamic> json) {
    return Presets(
      buttonGroups: (json['buttonGroups'] as List)
          .map((e) => ButtonGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buttonGroups': buttonGroups.map((e) => e.toJson()).toList(),
    };
  }

  getAirframe(Airframe airframe) {
    return buttonGroups.firstWhere(
      (e) => e.airframe == Airframe.f16,
    );
  }
}
