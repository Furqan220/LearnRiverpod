import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testapp/persistent_theme_change/theme_helper.dart';
part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  
  @override
  ThemeMode build(){
    return ref.watch(themeHelperProvider).getThemeMode();
  }

  ThemeMode getTheme(){
    return state;
  }



  void setTheme(){
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
    ref.read(themeHelperProvider).updateThemeMode(state);
  }
}