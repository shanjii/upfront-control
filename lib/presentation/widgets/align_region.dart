import 'package:flutter/material.dart';

class ConstrainedAlign extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final double widthFactor;
  final double heightFactor;
  final BoxConstraints constraints;

  const ConstrainedAlign({
    super.key,
    required this.child,
    required this.alignment,
    required this.constraints,
    this.widthFactor = 1,
    this.heightFactor = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: constraints.maxWidth * widthFactor,
        height: constraints.maxHeight * heightFactor,
        child: child,
      ),
    );
  }
}
