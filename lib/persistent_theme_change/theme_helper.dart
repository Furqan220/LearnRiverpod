import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_helper.g.dart';

@riverpod
ThemeHelper themeHelper(ThemeHelperRef ref) => ThemeHelper();


class ThemeHelper {
  final GetStorage _box = GetStorage();
  final String _key = "theme";


  ThemeMode getThemeMode()  {
    final theme =  _box.read(_key);

    if (theme == null) {
      return ThemeMode.system;
    }
    else {
      return ThemeMode.values[theme];
    }
  }

  void updateThemeMode (ThemeMode value){
    _box.write(_key, value);
  }
}