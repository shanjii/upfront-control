import 'package:flutter/material.dart';
import 'package:upfront_controls/core/enums/buttons/f16_buttons.dart';
import 'package:upfront_controls/presentation/common/button_collections/f16_collection.dart';

class F16Bottom extends StatelessWidget {
  const F16Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                F16Collection.getKeypad(F16Buttons.key1),
                F16Collection.getKeypad(F16Buttons.key2),
                F16Collection.getKeypad(F16Buttons.key3),
                const SizedBox(width: 10),
                F16Collection.getKeypad(F16Buttons.rcl),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                F16Collection.getKeypad(F16Buttons.key4),
                F16Collection.getKeypad(F16Buttons.key5),
                F16Collection.getKeypad(F16Buttons.key6),
                const SizedBox(width: 10),
                F16Collection.getKeypad(F16Buttons.entr),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                F16Collection.getKeypad(F16Buttons.key7),
                F16Collection.getKeypad(F16Buttons.key8),
                F16Collection.getKeypad(F16Buttons.key9),
                F16Collection.getKeypad(F16Buttons.key0),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
