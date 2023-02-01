import 'package:dio/dio.dart';
import 'package:hittok_assignment/constants/helper/app_exeptions.dart';

class LoginService {
  Future<String?> login(String email, String password) async {
    final dio = Dio();
    try {
      final response =
          await dio.post('https://hittok.in/oncab/api/login', data: {
        "username": email,
        "password": password,
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['token'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
