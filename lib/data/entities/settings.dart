import 'package:upfront_controls/core/enums/feedbacks.dart';

class Settings {
  final bool sleep;
  final bool vJoyMode;
  final bool maximize;
  final HapticType haptics;
  final String ip;
  final String port;

  const Settings({
    required this.sleep,
    required this.vJoyMode,
    required this.maximize,
    required this.haptics,
    required this.ip,
    required this.port,
  });

  Map<String, dynamic> toJson() => {
        'sleep': sleep,
        'vJoyMode': vJoyMode,
        'haptics': haptics.name,
        'maximize': maximize,
        'ip': ip,
        'port': port,
      };

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        sleep: json['sleep'] ?? false,
        vJoyMode: json['vJoyMode'] ?? false,
        maximize: json['maximize'] ?? false,
        haptics: HapticType.values.firstWhere(
          (e) => e.name == json['haptics'],
          orElse: () => HapticType.off,
        ),
        ip: json['ip'] ?? '',
        port: json['port'] ?? '',
      );

  Settings copyWith({
    bool? sleep,
    bool? vJoyMode,
    bool? sounds,
    bool? maximize,
    HapticType? haptics,
    String? ip,
    String? port,
  }) {
    return Settings(
      sleep: sleep ?? this.sleep,
      vJoyMode: vJoyMode ?? this.vJoyMode,
      maximize: maximize ?? this.maximize,
      haptics: haptics ?? this.haptics,
      port: port ?? this.port,
      ip: ip ?? this.ip,
    );
  }
}
