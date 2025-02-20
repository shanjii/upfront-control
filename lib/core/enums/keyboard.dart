// ignore_for_file: constant_identifier_names

enum KeyboardKeys {
  Left("0x25"),
  Up("0x26"),
  Right("0x27"),
  Down("0x28"),
  A("0x41"),
  B("0x42"),
  C("0x43"),
  D("0x44"),
  E("0x45"),
  F("0x46"),
  G("0x47"),
  H("0x48"),
  I("0x49"),
  J("0x4A"),
  K("0x4B"),
  L("0x4C"),
  M("0x4D"),
  N("0x4E"),
  O("0x4F"),
  P("0x50"),
  Q("0x51"),
  R("0x52"),
  S("0x53"),
  T("0x54"),
  U("0x55"),
  V("0x56"),
  W("0x57"),
  X("0x58"),
  Y("0x59"),
  Z("0x5A"),
  D0("0x30"),
  D1("0x31"),
  D2("0x32"),
  D3("0x33"),
  D4("0x34"),
  D5("0x35"),
  D6("0x36"),
  D7("0x37"),
  D8("0x38"),
  D9("0x39"),
  NumPad0("0x60"),
  NumPad1("0x61"),
  NumPad2("0x62"),
  NumPad3("0x63"),
  NumPad4("0x64"),
  NumPad5("0x65"),
  NumPad6("0x66"),
  NumPad7("0x67"),
  NumPad8("0x68"),
  NumPad9("0x69"),
  F1("0x70"),
  F2("0x71"),
  F3("0x72"),
  F4("0x73"),
  F5("0x74"),
  F6("0x75"),
  F7("0x76"),
  F8("0x77"),
  F9("0x78"),
  F10("0x79"),
  F11("0x7A"),
  F12("0x7B"),
  Multiply("0x6A"),
  Add("0x6B"),
  Separator("0x6C"),
  Subtract("0x6D"),
  Decimal("0x6E"),
  Divide("0x6F"),
  Tab("9"),
  Return("0xD"),
  Enter("0xD#"),
  Space("0x20"),
  PageUp("0x21"),
  PageDown("0x22"),
  End("0x23"),
  Home("0x24"),
  Insert("0x2D"),
  Backspace("8"),
  Delete("0x2E"),
  Execute("0x2B");

  const KeyboardKeys(this.value);
  final String value;

  static stringToKey(String string) {
    if (string.isEmpty) return '';
    for (var key in KeyboardKeys.values) {
      if (key.value == string) {
        return key.name;
      }
    }
  }
}

enum KeyboardModifiers {
  CapsLock("0x14"),
  LShift("0xA0"),
  RShift("0xA1"),
  LControl("0xA2"),
  RControl("0xA3"),
  LAlt("0xA4"),
  RAlt("0xA5");

  static stringToModifier(String string) {
    if (string.isEmpty) return '';
    for (var key in KeyboardModifiers.values) {
      if (key.value == string) {
        return key.name;
      }
    }
  }

  const KeyboardModifiers(this.value);
  final String value;
}
