import 'package:shared_preferences/shared_preferences.dart';

class  ResultSimplePrefrences {
  static SharedPreferences? _prefrences;

  static const _keyBMIResult = '0.0';
  static Future init() async =>
      _prefrences = await SharedPreferences.getInstance();

  static setBmiResult(double? result) async {
    await _prefrences?.setDouble(_keyBMIResult, result!);
  }

  static String? getBMIResult() => _prefrences!.getString(_keyBMIResult);
}
