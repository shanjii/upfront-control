import 'package:upfront_controls/data/entities/settings.dart';

releaseKeyUrl(Settings settings) {
  return Uri.parse(
    'http://${settings.ip}:${settings.port}/${settings.vJoyMode ? 'release-vjoy' : 'release-keyboard'}',
  );
}

pressKeyUrl(Settings settings) {
  return Uri.parse(
    'http://${settings.ip}:${settings.port}/${settings.vJoyMode ? 'press-vjoy' : 'press-keyboard'}',
  );
}
