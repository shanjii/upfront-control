import 'package:flutter/material.dart';
import 'package:upfront_controls/data/datasources/local/local_datasource.dart';
import 'package:upfront_controls/data/datasources/remote/remote_datasource.dart';
import 'package:upfront_controls/data/entities/button_group.dart';
import 'package:upfront_controls/data/entities/keybind.dart';
import 'package:upfront_controls/main.dart';
import 'package:upfront_controls/core/haptics.dart';
import 'package:upfront_controls/presentation/controllers/controls/aircraft_controller.dart';

class F16Controller extends ChangeNotifier implements AircraftController {
  final ButtonGroup buttonGroup;

  F16Controller({
    required this.buttonGroup,
  });

  @override
  void pressButton(String identifier) {
    Haptics.vibrate(kSettings.haptics);

    final button = buttonGroup.getKeybind(identifier);
    RemoteDatasource.send(keybind: button, press: true);

    print(button.keyboardKey);
  }

  @override
  void releaseButton(String identifier) {
    final button = buttonGroup.getKeybind(identifier);
    RemoteDatasource.send(keybind: button, press: false);

    print(button.keyboardKey);
  }

  @override
  void modifyButton({required Keybind keybind}) {
    final index = buttonGroup.keybinds.indexWhere(
      (e) => e.identifier == keybind.identifier,
    );

    buttonGroup.keybinds[index] = keybind;
    LocalDatasource.savePresets(buttonGroup);
    notifyListeners();
  }
}
