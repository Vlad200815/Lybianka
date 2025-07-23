// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class OnSaveProfileEvent extends SettingsEvent {
  const OnSaveProfileEvent({required this.profileModel});

  final ProfileModel profileModel;

  @override
  List<Object> get props => [profileModel];
}

class OnGetProfileEvent extends SettingsEvent {}
