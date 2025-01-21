import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/common/themes/f16_themes.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';

class F16Keypad extends StatefulWidget {
  const F16Keypad({
    super.key,
    required this.identifier,
    required this.label,
    this.topLabel,
    this.cornerLabel,
    this.functionButton = false,
  });

  final String? topLabel;
  final String label;
  final String? cornerLabel;
  final bool functionButton;
  final String identifier;

  @override
  State<F16Keypad> createState() => F16KeypadState();
}

class F16KeypadState extends State<F16Keypad> {
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
          padding: const EdgeInsets.all(2),
          decoration: F16ButtonTheme.keypad(isPressed: isPressed),
          child: _KeypadLabels(
            topLabel: widget.topLabel,
            label: widget.label,
            cornerLabel: widget.cornerLabel,
            functionButton: widget.functionButton,
          ),
        ),
      ),
    );
  }
}

class _KeypadLabels extends StatelessWidget {
  final String? topLabel;
  final String label;
  final String? cornerLabel;
  final bool functionButton;

  const _KeypadLabels({
    this.topLabel,
    required this.label,
    this.cornerLabel,
    this.functionButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            if (topLabel != null)
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  topLabel!,
                  style: TextStyle(
                    color: DefaultColors.label,
                    fontSize: constraints.maxHeight / 3.5,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              ),
            if (functionButton)
              Align(
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    color: DefaultColors.label,
                    fontSize: constraints.maxHeight / 3,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              )
            else
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  label,
                  style: TextStyle(
                    color: DefaultColors.label,
                    fontSize: constraints.maxHeight / 2,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              ),
            if (cornerLabel != null)
              Positioned(
                bottom: 0,
                right: 1,
                child: Text(
                  cornerLabel!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: DefaultColors.label,
                    fontSize: constraints.maxHeight / 3.5,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
