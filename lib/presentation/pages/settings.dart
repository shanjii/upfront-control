import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upfront_controls/core/enums/feedbacks.dart';
import 'package:upfront_controls/presentation/common/colors.dart';
import 'package:upfront_controls/presentation/controllers/settings/settings_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsController>(
      create: (context) => SettingsController(),
      child: Consumer<SettingsController>(
        builder: (context, controller, _) {
          return Scaffold(
            backgroundColor: DefaultColors.gray4,
            floatingActionButton: shouldShowSave(controller),
            body: NestedScrollView(
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
              body: Listener(
                onPointerDown: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return ListView(
                          padding: EdgeInsets.only(bottom: 120),
                          children: [
                            _Option(
                              title: 'IP and Port',
                              subtitle:
                                  'Used to communicate with the desktop server',
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth * 0.6,
                                  child: _Input(
                                    onChanged: controller.setIp,
                                    initial: controller.ip,
                                    hint: 'IP',
                                    backgroundColor: DefaultColors.gray1,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.4,
                                  child: _Input(
                                    onChanged: controller.setPort,
                                    initial: controller.port,
                                    hint: 'Port',
                                    backgroundColor: DefaultColors.gray2,
                                  ),
                                ),
                              ],
                            ),
                            _Option(
                              title: 'vJoy mode',
                              subtitle:
                                  'Use vJoy buttons instead of keyboard bindings. While this is active, all your keybinds will be ignored.',
                              children: [
                                _Button(
                                  title: "OFF",
                                  onTap: () => controller.setVjoy(false),
                                  condition: !controller.vJoyMode,
                                ),
                                _Button(
                                  title: "ON",
                                  onTap: () => controller.setVjoy(true),
                                  condition: controller.vJoyMode,
                                ),
                              ],
                            ),
                            _Option(
                              title: 'Button vibration',
                              children: [
                                _Button(
                                  title: "OFF",
                                  onTap: () =>
                                      controller.setHaptics(HapticType.off),
                                  condition:
                                      controller.haptics == HapticType.off,
                                ),
                                _Button(
                                  title: "Light",
                                  onTap: () =>
                                      controller.setHaptics(HapticType.light),
                                  condition:
                                      controller.haptics == HapticType.light,
                                ),
                                _Button(
                                  title: "Medium",
                                  onTap: () =>
                                      controller.setHaptics(HapticType.medium),
                                  condition:
                                      controller.haptics == HapticType.medium,
                                ),
                                _Button(
                                  title: "Heavy",
                                  onTap: () =>
                                      controller.setHaptics(HapticType.heavy),
                                  condition:
                                      controller.haptics == HapticType.heavy,
                                ),
                              ],
                            ),
                            _Option(
                              title: 'Extend behind Status Bar',
                              subtitle:
                                  'This can cause the buttons to become unreachable on some devices',
                              children: [
                                _Button(
                                  title: "OFF",
                                  onTap: () => controller.setMaximize(false),
                                  condition: !controller.maximize,
                                ),
                                _Button(
                                  title: "ON",
                                  onTap: () => controller.setMaximize(true),
                                  condition: controller.maximize,
                                ),
                              ],
                            ),
                            _Option(
                              title: 'Turn screen black on innactivity',
                              subtitle:
                                  'Useful on OLED screens to prevent burn-in, touch screen to restore.',
                              children: [
                                _Button(
                                  title: "OFF",
                                  onTap: () => controller.setSleep(false),
                                  condition: !controller.sleep,
                                ),
                                _Button(
                                  title: "ON",
                                  onTap: () => controller.setSleep(true),
                                  condition: controller.sleep,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  FloatingActionButton? shouldShowSave(SettingsController controller) {
    if (controller.hasChanges) {
      return FloatingActionButton.extended(
        backgroundColor: DefaultColors.label,
        foregroundColor: DefaultColors.black,
        label: Text('Save settings'),
        icon: Icon(Icons.save),
        onPressed: () {
          controller.saveSettings();
          Navigator.pop(context);
        },
      );
    } else {
      return null;
    }
  }
}

class _Option extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Widget> children;
  const _Option({this.title, this.subtitle, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(top: 15),
            child: Text(
              title!,
              style: TextStyle(fontSize: 24),
            ),
          ),
        if (subtitle != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              subtitle!,
              style: TextStyle(fontSize: 14),
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final bool condition;
  final VoidCallback onTap;
  final String title;
  const _Button({
    required this.condition,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: condition ? DefaultColors.gray2 : DefaultColors.gray1,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final Function(String value) onChanged;
  final String hint;
  final String initial;
  final Color backgroundColor;
  const _Input({
    required this.onChanged,
    required this.hint,
    required this.backgroundColor,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: backgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            decoration: InputDecoration.collapsed(
              hintText: hint,
            ),
            initialValue: initial,
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
