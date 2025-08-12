import 'model/intro_model.dart';

abstract interface class IntroInterfaceRepository {
  Future<void> setIntroSeen(IntroModel introModel);
  Future<String> getName();
  Future<bool> hasIntroSeen();
}
