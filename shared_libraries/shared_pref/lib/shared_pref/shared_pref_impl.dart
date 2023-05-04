import 'package:shared_pref/shared_pref/shared_pref.dart';
import 'package:resources/constant/string_constant.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

class SharedPrefImpl extends SharedPref {
  final SharedPreferences preferences;

  SharedPrefImpl({
    required this.preferences,
  });

  @override
  Future<bool> deleteUserData() async {
    preferences.remove(StringConstant.loginUser);
    return true;
  }

  @override
  Future<String> getPrefLanguage() async {
    String value = preferences.getString(StringConstant.languageData) ?? "";
    return value;
  }

  @override
  Future<int> getPrefLogin() async {
    int value = preferences.getInt(StringConstant.loginUser) ?? 0;
    return value;
  }

  @override
  Future<bool> getPrefOnBoarding() async {
    bool value = preferences.getBool(StringConstant.onBoarding) ?? false;
    return value;
  }

  @override
  Future<bool> getPrefSkipLogin() async {
    bool value = preferences.getBool(StringConstant.skipLogin) ?? false;
    return value;
  }

  @override
  Future<String> getTokenUser() async {
    String value = preferences.getString(StringConstant.tokenUser) ?? "";
    return value;
  }

  @override
  Future<String> getUserData() async {
    String value = preferences.getString(StringConstant.userData) ?? "";
    return value;
  }

  @override
  Future<int> getUserId() async {
    int value = preferences.getInt(StringConstant.userId) ?? 0;
    return value;
  }

  @override
  void setPrefLanguage(String language) async {
    preferences.setString(StringConstant.languageData, language);
  }

  @override
  void setPrefLogin(int val) async {
    preferences.setInt(StringConstant.loginUser, val);
  }

  @override
  void setPrefOnBoarding(bool val) async {
    preferences.setBool(StringConstant.onBoarding, val);
  }

  @override
  void setPrefSkipLogin(bool val) async {
    preferences.setBool(StringConstant.skipLogin, val);
  }

  @override
  void setTokenUser(String val) async {
    preferences.setString(StringConstant.tokenUser, val);
  }

  @override
  void setUserData(String val) async {
    preferences.setString(StringConstant.userData, val);
  }

  @override
  void setUserId(int val) async {
    preferences.setInt(StringConstant.userId, val);
  }
}