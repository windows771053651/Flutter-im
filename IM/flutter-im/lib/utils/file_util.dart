class FileUtil {
  static String getImagePath(String name, {String format: 'png',}) {
    return 'images/$name.$format';
  }

  static String getAssetsPath(String dir, String name, {String format: 'png',}) {
    return 'assets/$dir/$name.$format';
  }
}
