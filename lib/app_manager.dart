class AppManager {
  int animationNum = 0;
  final numberOfAnimation = 12;

  static final shared = AppManager();

  String animationPath({required String filepath}) {
    if (filepath.contains("meo_con_di_hoc")) {
      return "assets/videos/ac1.mp4";
    } else {
      int num = (animationNum % numberOfAnimation) + 1;
      animationNum += 1;

      return "assets/videos/ac$num.mp4";
    }
  }
}
