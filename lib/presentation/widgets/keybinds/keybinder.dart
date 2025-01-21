import 'package:flutter/material.dart';
import 'package:upfront_controls/core/enums/key_types.dart';
import 'package:upfront_controls/core/enums/keyboard.dart';
import 'package:upfront_controls/data/entities/keybind.dart';
import 'package:upfront_controls/presentation/common/bottomsheet.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/widgets/keybinds/keybind_selector.dart';

class Keybinder extends StatelessWidget {
  final Widget button;
  final Keybind keybind;
  final Function(Keybind keybind) onAdd;

  const Keybinder({
    super.key,
    required this.button,
    required this.keybind,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: button,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 80,
                child: Row(
                  children: [
                    _KeybindCard(
                      type: KeyType.key,
                      keybind: keybind,
                      onAdd: onAdd,
                    ),
                    _KeybindCard(
                      type: KeyType.modifer,
                      keybind: keybind,
                      onAdd: onAdd,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeybindCard extends StatelessWidget {
  final KeyType type;
  final Keybind keybind;
  final Function(Keybind keybind) onAdd;
  const _KeybindCard({
    required this.type,
    required this.keybind,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        color: switch (type) {
          KeyType.key => activeColor(keybind.keyboardKey.isEmpty),
          KeyType.modifer => activeColor(keybind.modifier.isEmpty),
        },
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => defaultBottomSheet(
            context,
            modalWidget: KeybindSelector(
              type: type,
              keybind: keybind,
              onAdd: onAdd,
            ),
          ),
          child: Center(
            child: switch (type) {
              KeyType.key => Text(
                  KeyboardKeys.stringToKey(keybind.keyboardKey),
                  style: TextStyle(fontSize: 16),
                ),
              KeyType.modifer => Text(
                  KeyboardModifiers.stringToModifier(keybind.modifier),
                  style: TextStyle(fontSize: 16),
                ),
            },
          ),
        ),
      ),
    );
  }

  activeColor(bool condition) {
    return condition ? DefaultColors.gray2 : DefaultColors.gray3;
  }
}
