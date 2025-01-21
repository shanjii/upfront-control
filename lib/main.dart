import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/core/device.dart';
import 'package:upfront_controls/core/enums/airframes.dart';
import 'package:upfront_controls/data/datasources/local/local_datasource.dart';
import 'package:upfront_controls/data/entities/settings.dart';
import 'package:upfront_controls/presentation/controllers/controls/f16_controller.dart';
import 'package:upfront_controls/presentation/controllers/controls/f18_controller.dart';
import 'package:upfront_controls/presentation/pages/home.dart';

late Settings kSettings;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  kSettings = await LocalDatasource.fetchSettings();

  final presets = await LocalDatasource.fetchAllPresets();

  Device.resetScreenMode();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => F16Controller(
            buttonGroup: presets.getAirframe(Airframe.f16),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => F18Controller(
            buttonGroup: presets.getAirframe(Airframe.f18),
          ),
        ),
      ],
      builder: (context, widget) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: HomePage(),
        );
      },
    ),
  );
}
