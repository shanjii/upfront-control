import 'package:flutter/material.dart';
import 'package:upfront_controls/presentation/common/colors.dart';

class F16ButtonTheme {
  static BoxDecoration circleButton({bool isPressed = false}) {
    return BoxDecoration(
      color: isPressed
          ? DefaultColors.f16RoundButtonDepress
          : DefaultColors.f16RoundButton,
      border: Border.all(
        color: isPressed
            ? DefaultColors.f16RoundButtonOuterDepress
            : DefaultColors.f16RoundButtonOuter,
        width: 3,
      ),
      shape: BoxShape.circle,
    );
  }

  static BoxDecoration circleButtonSolid({bool isPressed = false}) {
    return BoxDecoration(
      color: isPressed
          ? DefaultColors.f16RoundButtonDepress
          : DefaultColors.f16RoundButton,
      shape: BoxShape.circle,
    );
  }

  static BoxDecoration keypad({bool isPressed = false}) {
    return BoxDecoration(
      color: isPressed
          ? DefaultColors.f16ButtonInnerDepress
          : DefaultColors.f16ButtonInner,
      border: Border.all(
        color: isPressed
            ? DefaultColors.f16ButtonOuterDepress
            : DefaultColors.f16ButtonOuter,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }
}
