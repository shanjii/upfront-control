import 'package:upfront_controls/data/entities/keybind.dart';

abstract class AircraftController {
  void pressButton(String identifier);

  void releaseButton(String identifier);

  void modifyButton({required Keybind keybind});
}
