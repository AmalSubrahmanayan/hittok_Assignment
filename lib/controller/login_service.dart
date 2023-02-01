import 'package:dio/dio.dart';
import 'package:hittok_assignment/constants/helper/app_exeptions.dart';
import 'package:hittok_assignment/model/onboard_screen_model.dart';

class LoginService {
  Future<UserDataResponce?> login(String email, String password) async {
    final dio = Dio();
    try {
      final Response response =
          await dio.post('https://hittok.in/oncab/api/login', data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        UserDataResponce data = UserDataResponce.fromJson(response.data);

        return data;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
