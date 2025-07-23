import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:lybianka/repositories/settings_repository/model/profile_model.dart';
import 'package:lybianka/repositories/settings_repository/settings_repository_export.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepo;
  SettingsBloc({required this.settingsRepo}) : super(SettingsInitial()) {
    on<OnSaveProfileEvent>((event, emit) async {
      try {
        await settingsRepo.saveProfile(event.profileModel);
        // emit(SettingsGetSuccessState(profileModel: event.profileModel));
      } catch (e) {
        log(e.toString());
      }
    });

    on<OnGetProfileEvent>((event, emit) async {
      try {
        final ProfileModel profileModel = await settingsRepo.getProfile();
        emit(SettingsGetSuccessState(profileModel: profileModel));
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
