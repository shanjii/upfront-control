import 'package:flutter/material.dart';
import 'package:upfront_controls/core/enums/buttons/f16_buttons.dart';
import 'package:upfront_controls/presentation/common/button_collections/f16_collection.dart';

class F16Top extends StatelessWidget {
  const F16Top({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 19 / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: F16Collection.getCircleButton(F16Buttons.com1),
          ),
          Expanded(
            child: F16Collection.getCircleButton(F16Buttons.com2),
          ),
          Expanded(
            child: F16Collection.getCircleButton(F16Buttons.iff),
          ),
          Expanded(
            child: F16Collection.getCircleButton(F16Buttons.list),
          ),
          Expanded(
            child: F16Collection.getCircleButton(F16Buttons.aa),
          ),
          Expanded(
            child: F16Collection.getCircleButton(F16Buttons.ag),
          ),
        ],
      ),
    );
  }
}
