import 'package:flutter/material.dart';
import 'package:upfront_controls/main.dart';
import 'package:upfront_controls/presentation/common/colors.dart';

class KeybindBasePage extends StatelessWidget {
  final Widget child;
  final String title;
  const KeybindBasePage({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.gray4,
      body: SafeArea(
        top: kSettings.vJoyMode,
        bottom: false,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: DefaultColors.gray4,
                scrolledUnderElevation: 0,
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  "Settings",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              if (kSettings.vJoyMode)
                Container(
                  height: kToolbarHeight,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'vJoy mode is enabled',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
