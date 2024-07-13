import 'package:flutter/material.dart';

sealed class AppIcons {
  static const String _packageName = 'design_system';

  static const kingLogo =
      AssetImage(package: _packageName, 'assets/icons/kinglogo.png');
}