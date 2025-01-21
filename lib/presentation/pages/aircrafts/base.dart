import 'package:flutter/material.dart';
import 'package:upfront_controls/core/device.dart';
import 'package:upfront_controls/main.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/core/screen_timer.dart';

class AircraftBasePage extends StatefulWidget {
  final Widget child;
  const AircraftBasePage({super.key, required this.child});

  @override
  State<AircraftBasePage> createState() => _BasePageState();
}

class _BasePageState extends State<AircraftBasePage> {
  ScreenTimer timer = ScreenTimer();

  @override
  void initState() {
    Device.setLandscapeMode();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (kSettings.sleep) timer.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Device.resetScreenMode();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: timer.sleep,
      builder: (context, sleep, _) {
        return Listener(
          onPointerDown: (_) => timer.reset(),
          child: AnimatedOpacity(
            opacity: sleep ? 0 : 1,
            duration: Durations.extralong1,
            child: Scaffold(
              backgroundColor: DefaultColors.black,
              body: SafeArea(
                top: false,
                bottom: false,
                right: !kSettings.maximize,
                left: !kSettings.maximize,
                child: IgnorePointer(
                  ignoring: sleep,
                  child: widget.child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
