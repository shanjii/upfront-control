import 'package:flutter/material.dart';
import 'package:upfront_controls/presentation/widgets/align_region.dart';
import 'package:upfront_controls/presentation/pages/aircrafts/base.dart';
import 'package:upfront_controls/presentation/widgets/f16/groups/bottom.dart';
import 'package:upfront_controls/presentation/widgets/f16/groups/left.dart';
import 'package:upfront_controls/presentation/widgets/f16/groups/right.dart';
import 'package:upfront_controls/presentation/widgets/f16/groups/top.dart';

class F16Page extends StatelessWidget {
  const F16Page({super.key});

  @override
  Widget build(BuildContext context) {
    return AircraftBasePage(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              ConstrainedAlign(
                alignment: Alignment.centerLeft,
                constraints: constraints,
                widthFactor: 0.2,
                child: const F16Left(),
              ),
              ConstrainedAlign(
                alignment: Alignment.center,
                constraints: constraints,
                widthFactor: 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight * 0.3,
                      ),
                      child: const F16Top(),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight * 0.7,
                      ),
                      child: const F16Bottom(),
                    ),
                  ],
                ),
              ),
              ConstrainedAlign(
                alignment: Alignment.centerRight,
                constraints: constraints,
                widthFactor: 0.2,
                child: F16Right(),
              ),
            ],
          );
        },
      ),
    );
  }
}
