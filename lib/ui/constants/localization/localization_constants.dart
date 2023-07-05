import 'package:flutter/material.dart';

class LocalizationConstants {
  LocalizationConstants._();

  static const path = "assets/lang";
  static const Locale enLocale = Locale('en', 'US');
  static const Locale trLocale = Locale('tr', 'TUR');
  static const supportedLocales = [enLocale, trLocale];
}
