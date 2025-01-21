import 'package:flutter/material.dart';
import 'package:upfront_controls/presentation/common/button_collections/f16_collection.dart';

class F16Right extends StatelessWidget {
  const F16Right({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth * 0.4,
                maxHeight: constraints.maxHeight * 0.33,
              ),
              child: F16Collection.getWx(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth * 0.45,
                maxHeight: constraints.maxHeight * 0.33,
              ),
              child: F16Collection.getRightRocker(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight * 0.33,
                maxWidth: constraints.maxWidth * 0.8,
              ),
              child: F16Collection.getSwitch(),
            )
          ],
        );
      },
    );
  }
}
