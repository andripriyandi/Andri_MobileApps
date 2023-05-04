abstract class SharedPref {
  void setPrefSkipLogin(bool val);

  Future<bool> getPrefSkipLogin();

  void setPrefOnBoarding(bool val);

  Future<bool> getPrefOnBoarding();

  void setPrefLanguage(String language);

  Future<String> getPrefLanguage();

  void setPrefLogin(int val);

  Future<int> getPrefLogin();

  void setUserData(String val);

  Future<String> getUserData();

  void setTokenUser(String val);

  Future<String> getTokenUser();

  Future<bool> deleteUserData();

  void setUserId(int val);

  Future<int> getUserId();
}
