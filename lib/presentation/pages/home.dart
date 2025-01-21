import 'package:flutter/material.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/core/navigation.dart';
import 'package:upfront_controls/presentation/pages/aircrafts/f16.dart';
import 'package:upfront_controls/presentation/pages/keybinds/f16_keybinds.dart';
import 'package:upfront_controls/presentation/pages/aircrafts/f18.dart';
import 'package:upfront_controls/presentation/pages/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.gray4,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: DefaultColors.gray4,
        title: Text(
          "Select your module",
          style: TextStyle(fontSize: 23),
        ),
        actions: [
          IconButton(
            onPressed: () => navigateTo(context, page: SettingsPage()),
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (_, orientation) => _Menu(orientation: orientation),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  final Orientation orientation;

  const _Menu({required this.orientation});

  @override
  Widget build(BuildContext context) {
    final options = [
      _Option(
        title: 'F16',
        onTapCard: () => navigateTo(context, page: F16Page()),
        onTapSettings: () => navigateTo(context, page: F16KeybindsPage()),
      ),
      _Option(
        title: 'F18',
        onTapCard: () => navigateTo(context, page: F18Page()),
        onTapSettings: () {},
      ),
    ];

    return ListView(
      scrollDirection: switch (orientation) {
        Orientation.landscape => Axis.horizontal,
        Orientation.portrait => Axis.vertical,
      },
      children: options,
    );
  }
}

class _Option extends StatelessWidget {
  final String title;
  final VoidCallback onTapCard;
  final VoidCallback onTapSettings;
  const _Option({
    required this.title,
    required this.onTapCard,
    required this.onTapSettings,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 53, 53, 53),
        child: Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTapCard,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.edit_note_rounded, size: 50),
                color: Colors.white,
                onPressed: onTapSettings,
              ),
            )
          ],
        ),
      ),
    );
  }
}
