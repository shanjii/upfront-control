import 'package:flutter/material.dart';
import 'package:upfront_controls/core/device.dart';
import 'package:upfront_controls/presentation/common/colors.dart';

defaultBottomSheet(BuildContext context, {required Widget modalWidget}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: DefaultColors.gray3,
    builder: (context) {
      return SizedBox(
        height: Device.height(context) * 0.8,
        child: modalWidget,
      );
    },
  );
}
