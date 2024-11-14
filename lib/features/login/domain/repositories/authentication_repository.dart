import 'package:simple_login/features/login/data/datasources/dio_service.dart';

class AuthenticationRepository {
  final DioService dio;

  AuthenticationRepository({required this.dio});

  Future<String> logIn({required String password}) async {
    try {
      final isValid = await validatePassword(password);
      if (isValid == 'valid') {
        return 'its ok';
      } else {
        return 'its not ok';
      }
    } catch (e) {
      throw Exception('Error authentication: $e');
    }
  }

  Future<String> validatePassword(String password) async {
  
      final user = await dio.validatePassword(password);
      return user.message; 
  }
}
