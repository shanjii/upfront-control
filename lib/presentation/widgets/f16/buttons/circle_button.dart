import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/common/themes/f16_themes.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';

class F16CircleButton extends StatefulWidget {
  const F16CircleButton({
    super.key,
    required this.label,
    this.secondLabel,
    required this.identifier,
  });

  final String label;
  final String identifier;
  final String? secondLabel;

  @override
  State<F16CircleButton> createState() => F16CircleButtonState();
}

class F16CircleButtonState extends State<F16CircleButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<F16Controller>(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Listener(
        onPointerDown: (details) {
          setState(() => isPressed = true);
          controller.pressButton(widget.identifier);
        },
        onPointerUp: (details) {
          setState(() => isPressed = false);
          controller.releaseButton(widget.identifier);
        },
        onPointerCancel: (details) {
          setState(() => isPressed = false);
          controller.releaseButton(widget.identifier);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: F16ButtonTheme.circleButton(isPressed: isPressed),
          child: _Label(
            label: widget.label,
            secondLabel: widget.secondLabel,
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String label;
  final String? secondLabel;
  const _Label({required this.label, this.secondLabel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: DefaultColors.label,
                fontSize: constraints.maxHeight / 3,
                letterSpacing: 0,
                height: 1,
              ),
            ),
            if (secondLabel != null)
              Text(
                secondLabel!,
                style: TextStyle(
                  color: DefaultColors.label,
                  fontSize: constraints.maxHeight / 3,
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
          ],
        );
      },
    );
  }
}
