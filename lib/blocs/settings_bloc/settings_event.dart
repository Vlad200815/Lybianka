part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class OnSaveProfileEvent extends SettingsEvent {
  const OnSaveProfileEvent({required this.profileModel});

  final ProfileModel profileModel;
}

class OnGetProfileEvent extends SettingsEvent {}
