part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsGetSuccessState extends SettingsState {
  const SettingsGetSuccessState({required this.profileModel});

  final ProfileModel profileModel;

  @override
  List<Object> get props => [profileModel];
}
