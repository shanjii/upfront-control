import 'package:flutter/material.dart';
import 'package:upfront_controls/presentation/common/button_collections/f16_collection.dart';

class F16Left extends StatelessWidget {
  const F16Left({super.key});

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
                maxWidth: constraints.maxWidth * 0.45,
                maxHeight: constraints.maxHeight * 0.33,
              ),
              child: F16Collection.getLeftRocker(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight * 0.40,
                maxWidth: constraints.maxWidth,
              ),
              child: F16Collection.getDobber(),
            )
          ],
        );
      },
    );
  }
}
