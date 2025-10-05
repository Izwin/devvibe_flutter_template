import 'package:flutter/cupertino.dart';

abstract class LocaleRepository {
  Future<Locale> getSavedLocale();
  Future<void> saveLocale(Locale locale);
}
