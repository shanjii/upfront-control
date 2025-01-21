import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';

class F16Selector extends StatefulWidget {
  const F16Selector({
    super.key,
    required this.labelUp,
    required this.labelDown,
    required this.upIdentifier,
    required this.downIdentifier,
  });

  final String labelUp;
  final String upIdentifier;
  final String labelDown;
  final String downIdentifier;

  @override
  State<F16Selector> createState() => _F16SelectorState();
}

class _F16SelectorState extends State<F16Selector> {
  bool pressedUp = false;
  bool pressedDown = false;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<F16Controller>(context);

    return AspectRatio(
      aspectRatio: 1 / 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _setGradientType(),
          ),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Listener(
                onPointerDown: (details) {
                  setState(() => pressedUp = true);
                  controller.pressButton(widget.upIdentifier);
                },
                onPointerUp: (details) {
                  setState(() => pressedUp = false);
                  controller.releaseButton(widget.upIdentifier);
                },
                onPointerCancel: (details) {
                  setState(() => pressedUp = false);
                  controller.releaseButton(widget.upIdentifier);
                },
                child: _Button(label: widget.labelUp),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Listener(
                onPointerDown: (details) {
                  setState(() => pressedDown = true);
                  controller.pressButton(widget.downIdentifier);
                },
                onPointerUp: (details) {
                  setState(() => pressedDown = false);
                  controller.releaseButton(widget.downIdentifier);
                },
                onPointerCancel: (details) {
                  setState(() => pressedDown = false);
                  controller.releaseButton(widget.downIdentifier);
                },
                child: _Button(label: widget.labelDown),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setGradientType() {
    if (pressedUp) {
      return [
        DefaultColors.f16ButtonInnerDepress,
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInnerElevated,
      ];
    } else if (pressedDown) {
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
}

class _Button extends StatelessWidget {
  final String label;
  const _Button({required this.label});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(5),
          color: Colors.transparent,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: constraints.maxHeight / 3,
                color: DefaultColors.label,
              ),
            ),
          ),
        );
      },
    );
  }
}
