import 'package:dio/dio.dart';
import 'package:hittok_assignment/constants/helper/app_exeptions.dart';

class LoginService {
  Future login(String email, String password) async {
    final dio = Dio();
    try {
      final response =
          await dio.post('https://hittok.in/oncab/api/login', data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
