import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:upfront_controls/core/enums/buttons/f16_buttons.dart';
import 'package:upfront_controls/presentation/common/button_collections/f16_collection.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';
import 'package:upfront_controls/presentation/pages/keybinds/keybind_base_page.dart';
import 'package:upfront_controls/presentation/widgets/f16/buttons/circle_solid_button.dart';
import 'package:upfront_controls/presentation/widgets/keybinds/keybinder.dart';

class F16KeybindsPage extends StatefulWidget {
  const F16KeybindsPage({super.key});

  @override
  State<F16KeybindsPage> createState() => _F16KeybindsState();
}

class _F16KeybindsState extends State<F16KeybindsPage> {
  @override
  Widget build(BuildContext context) {
    return KeybindBasePage(
      title: "F16 Keybinds",
      child: Consumer<F16Controller>(
        builder: (context, controller, _) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              for (var button in F16Collection.circleButtons)
                Keybinder(
                  button: button,
                  keybind: controller.buttonGroup.getKeybind(
                    button.identifier,
                  ),
                  onAdd: (keybind) => controller.modifyButton(keybind: keybind),
                ),
              for (var button in F16Collection.keypads)
                Keybinder(
                  button: button,
                  keybind: controller.buttonGroup.getKeybind(
                    button.identifier,
                  ),
                  onAdd: (keybind) => controller.modifyButton(keybind: keybind),
                ),
              Keybinder(
                button: F16CircleSolidButton(
                  identifier: F16Buttons.aa.name,
                  label: "WX",
                ),
                keybind: controller.buttonGroup.getKeybind(
                  F16Buttons.wx.name,
                ),
                onAdd: (keybind) => controller.modifyButton(keybind: keybind),
              ),
            ],
          );
        },
      ),
    );
  }
}
