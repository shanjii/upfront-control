import 'package:flutter/material.dart';
import 'package:upfront_controls/core/enums/key_types.dart';
import 'package:upfront_controls/core/enums/keyboard.dart';
import 'package:upfront_controls/data/entities/keybind.dart';
import 'package:upfront_controls/presentation/common/colors.dart';

class KeybindSelector extends StatelessWidget {
  final KeyType type;
  final Keybind keybind;
  final Function(Keybind keybind) onAdd;
  const KeybindSelector({
    super.key,
    required this.type,
    required this.keybind,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: [
        _nullKeybutton(context),
        if (type == KeyType.key)
          for (var key in KeyboardKeys.values)
            _keyButton(
              context,
              type: type,
              value: key.value,
            )
        else
          for (var modifier in KeyboardModifiers.values)
            _keyButton(
              context,
              type: type,
              value: modifier.value,
            )
      ],
    );
  }

  _nullKeybutton(BuildContext context) {
    return Card(
      color: DefaultColors.gray1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (type == KeyType.key) {
            onAdd(keybind.copyWith(keyboardKey: ''));
          } else {
            onAdd(keybind.copyWith(modifier: ''));
          }
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            "None",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  _keyButton(
    BuildContext context, {
    required KeyType type,
    required String value,
  }) {
    return Card(
      color: DefaultColors.gray2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (type == KeyType.key) {
            onAdd(keybind.copyWith(keyboardKey: value));
          } else {
            onAdd(keybind.copyWith(modifier: value));
          }
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            switch (type) {
              KeyType.key => KeyboardKeys.stringToKey(value),
              KeyType.modifer => KeyboardModifiers.stringToModifier(value),
            },
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
