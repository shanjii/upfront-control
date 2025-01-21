import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';

class F16Dobber extends StatefulWidget {
  const F16Dobber({
    super.key,
    required this.leftIdentifier,
    required this.rightIdentifier,
    required this.topIdentifier,
    required this.bottomIdentifier,
  });

  final String leftIdentifier;
  final String rightIdentifier;
  final String topIdentifier;
  final String bottomIdentifier;

  @override
  State<F16Dobber> createState() => _F16DobberState();
}

class _F16DobberState extends State<F16Dobber> {
  _PressedButton pressedButton = _PressedButton.none;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<F16Controller>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Listener(
          onPointerDown: (details) => getTapLocation(
            constraints: constraints,
            details: details,
            topPress: () {
              controller.pressButton(widget.topIdentifier);
            },
            rightPress: () {
              controller.pressButton(widget.rightIdentifier);
            },
            leftPress: () {
              controller.pressButton(widget.leftIdentifier);
            },
            bottomPress: () {
              controller.pressButton(widget.bottomIdentifier);
            },
          ),
          onPointerUp: (details) => releaseButton(
            topPress: () {
              controller.releaseButton(widget.topIdentifier);
            },
            rightPress: () {
              controller.releaseButton(widget.rightIdentifier);
            },
            leftPress: () {
              controller.releaseButton(widget.leftIdentifier);
            },
            bottomPress: () {
              controller.releaseButton(widget.bottomIdentifier);
            },
          ),
          onPointerCancel: (details) => releaseButton(
            topPress: () {
              controller.releaseButton(widget.topIdentifier);
            },
            rightPress: () {
              controller.releaseButton(widget.rightIdentifier);
            },
            leftPress: () {
              controller.releaseButton(widget.leftIdentifier);
            },
            bottomPress: () {
              controller.releaseButton(widget.bottomIdentifier);
            },
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DefaultColors.f16ButtonInner,
                gradient: gradient(),
              ),
              child: Stack(
                children: [
                  _VerticalAxis(),
                  _HorizontalAxis(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  gradient() {
    if (pressedButton == _PressedButton.left ||
        pressedButton == _PressedButton.right) {
      return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: gradientColors(),
      );
    } else {
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: gradientColors(),
      );
    }
  }

  gradientColors() {
    if (pressedButton == _PressedButton.left ||
        pressedButton == _PressedButton.top) {
      return [
        DefaultColors.f16ButtonInnerDepress,
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInnerElevated,
      ];
    } else if (pressedButton == _PressedButton.right ||
        pressedButton == _PressedButton.bottom) {
      return [
        DefaultColors.f16ButtonInnerElevated,
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInnerDepress,
      ];
    } else {
      return [
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInner,
      ];
    }
  }

  getTapLocation({
    required BoxConstraints constraints,
    required PointerDownEvent details,
    required Function() topPress,
    required Function() bottomPress,
    required Function() rightPress,
    required Function() leftPress,
  }) {
    // Calculate relative position from center
    final dx = details.localPosition.dx - constraints.maxWidth / 2;
    final dy = details.localPosition.dy - constraints.maxHeight / 2;

    // Use absolute values to determine which axis has larger displacement
    final isHorizontalDominant = dx.abs() > dy.abs();

    if (isHorizontalDominant) {
      // Horizontal press (left/right)
      if (dx > 0) {
        rightPress();
        setState(() => pressedButton = _PressedButton.right);
      } else {
        leftPress();
        setState(() => pressedButton = _PressedButton.left);
      }
    } else {
      // Vertical press (top/bottom)
      if (dy > 0) {
        bottomPress();
        setState(() => pressedButton = _PressedButton.bottom);
      } else {
        topPress();
        setState(() => pressedButton = _PressedButton.top);
      }
    }
  }

  releaseButton({
    required Function() topPress,
    required Function() bottomPress,
    required Function() rightPress,
    required Function() leftPress,
  }) {
    switch (pressedButton) {
      case _PressedButton.top:
        topPress();
      case _PressedButton.left:
        leftPress();
      case _PressedButton.right:
        rightPress();
      case _PressedButton.bottom:
        bottomPress();
      default:
    }
    setState(() => pressedButton = _PressedButton.none);
  }
}

class _HorizontalAxis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RTN",
                style: TextStyle(
                  color: DefaultColors.label,
                  fontSize: constraints.maxWidth / 6.5,
                ),
              ),
              Text(
                "SEQ",
                style: TextStyle(
                  color: DefaultColors.label,
                  fontSize: constraints.maxWidth / 6.5,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _VerticalAxis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "▲",
                style: TextStyle(
                  color: DefaultColors.label,
                  fontSize: constraints.maxWidth / 5,
                ),
              ),
              Text(
                "▼",
                style: TextStyle(
                  color: DefaultColors.label,
                  fontSize: constraints.maxWidth / 5,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

enum _PressedButton {
  top,
  left,
  right,
  bottom,
  none,
}
