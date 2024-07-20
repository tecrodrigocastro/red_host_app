extension MegaByteExtension on int {
  String get toGigabytes => '${(this / 1024).toStringAsFixed(2)}GB';
}
