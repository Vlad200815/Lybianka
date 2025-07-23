import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lybianka/repositories/settings_repository/settings_repository_export.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required SettingsRepositoryInterface settingsRepo})
    : _settingsRepo = settingsRepo,
      super(ThemeState(brightness: Brightness.light)) {
    _heckSelectedTheme();
  }

  final SettingsRepositoryInterface _settingsRepo;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness: brightness));
    await _settingsRepo.setDarkThemeSelected(brightness == Brightness.dark);
  }

  void _heckSelectedTheme() {
    try {
      final brightness = _settingsRepo.isDarkThemeSelected()
          ? Brightness.dark
          : Brightness.light;
      emit(ThemeState(brightness: brightness));
    } catch (e) {
      log(e.toString());
    }
  }
}
