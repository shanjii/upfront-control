class Keybind {
  final String identifier;
  final String keyboardKey;
  final int vJoyKey;
  final String modifier;

  const Keybind({
    required this.identifier,
    required this.keyboardKey,
    required this.vJoyKey,
    required this.modifier,
  });

  Map<String, dynamic> toJson() => {
        'identifier': identifier,
        'Key': keyboardKey,
        'JoyKey': vJoyKey,
        'Modifier': modifier,
      };

  factory Keybind.fromJson(Map<String, dynamic> json) => Keybind(
        identifier: json['identifier'] as String,
        keyboardKey: json['keyboardKey'] as String,
        vJoyKey: json['vJoyKey'] as int,
        modifier: json['modifier'] as String,
      );

  Keybind copyWith({
    String? keyboardKey,
    String? modifier,
  }) {
    return Keybind(
      keyboardKey: keyboardKey ?? this.keyboardKey,
      modifier: modifier ?? this.modifier,
      identifier: identifier,
      vJoyKey: vJoyKey,
    );
  }
}
