import 'package:dio/dio.dart';
import 'package:simple_login/features/login/domain/entities/user_entitie.dart';

class DioService {
  static const _baseUrl = 'https://desafioflutter-api.modelviewlabs.com/';

  final Dio dio;

  DioService()
      : dio = Dio(
          BaseOptions(
            baseUrl: _baseUrl,
          ),
        ) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<String> getRandomPassword() async {
    final response = await dio.get('/random');
    if (response.statusCode == 200) {
      return response.data['password'];
    } else {
      throw Exception('Error to create random password.');
    }
  }

  Future<UserEntitie> validatePassword(String password, Dio dio) async {
    final response = await dio.post('/validate', data: {'password': password});

    if (response.statusCode == 200) {
      return response.data['password'];
    } else {
      throw Exception('Password invalid.');
    }
  }
}
