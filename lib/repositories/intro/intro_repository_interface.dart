import 'package:lybianka/repositories/intro/intro_repository_expo.dart';

abstract interface class IntroRepositoryInterface {
  Future<void> saveIntroInfo(IntroModel introModel);
  Future<IntroModel> getIntroInfo();
}
