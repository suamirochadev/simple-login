import 'package:simple_login/features/login/data/datasources/dio_service.dart';

class AuthenticationRepository {
  final DioService dio;

  AuthenticationRepository({required this.dio});

  Future<bool> logIn({required String password, dio}) async {
    try {
      final response = await dio.validatePassword(password);
      if (response['password'] == password) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
