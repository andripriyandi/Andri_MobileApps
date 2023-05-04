class StringConstant {
  static const pathIcon = "assets/icons/";
  static const pathImage = "assets/images/";
  static const pathIllustration = "assets/illustration/";
  static const onBoarding = "onboardingCache";
  static const skipLogin = "skipLogin";
  static const tokenUser = "tokenUser";
  static const loginUser = "loginUsers";
  static const userData = "userData";
  static const languageData = "languageData";
  static const userId = "userId";

  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");

    return paths[paths.length - 1];
  }
}
