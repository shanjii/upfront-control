import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';

class F16Switch extends StatefulWidget {
  const F16Switch({
    super.key,
    required this.topIdentifier,
    required this.midIdentifier,
    required this.botIdentifier,
  });

  final String topIdentifier;
  final String midIdentifier;
  final String botIdentifier;

  @override
  State<F16Switch> createState() => _F16SwitchState();
}

class _F16SwitchState extends State<F16Switch> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<F16Controller>(context);

    return Container(
      color: DefaultColors.f16ButtonInner,
      child: Column(
        children: [
          _Button(
            title: "DRIFT C/O",
            color: DefaultColors.f16ButtonInner,
            onPress: () {
              controller.pressButton(widget.topIdentifier);
            },
            onRelease: () {
              controller.releaseButton(widget.topIdentifier);
            },
          ),
          _Button(
            title: "NORM",
            color: DefaultColors.f16ButtonInner,
            onPress: () {
              controller.pressButton(widget.midIdentifier);
            },
            onRelease: () {
              controller.releaseButton(widget.midIdentifier);
            },
          ),
          _Button(
            title: "WRN RST",
            color: DefaultColors.f16RoundButton,
            onPress: () {
              controller.pressButton(widget.botIdentifier);
            },
            onRelease: () {
              controller.releaseButton(widget.botIdentifier);
            },
          ),
        ],
      ),
    );
  }
}

class _Button extends StatefulWidget {
  final String title;
  final Color color;
  final Function() onPress;
  final Function() onRelease;

  const _Button({
    required this.title,
    required this.onPress,
    required this.onRelease,
    required this.color,
  });

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Listener(
        onPointerDown: (details) {
          setState(() => pressed = true);
          widget.onPress();
        },
        onPointerUp: (details) {
          setState(() => pressed = false);
          widget.onRelease();
        },
        onPointerCancel: (details) {
          setState(() => pressed = false);
          widget.onRelease();
        },
        child: Container(
          color: pressed ? DefaultColors.f16ButtonInnerDepress : widget.color,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: DefaultColors.label,
                    fontSize: constraints.maxHeight / 3,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
