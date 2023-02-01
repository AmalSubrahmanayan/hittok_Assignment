class OnboardScreenModel {
  final String bodyText;
  final String buttonText;
  final String imagePath;
  OnboardScreenModel({
    required this.bodyText,
    required this.buttonText,
    required this.imagePath,
  });
}

class UserData {
  UserData({
    required this.email,
    required this.password,
  });

  String email;
  int password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class UserDataResponce {
  UserDataResponce({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory UserDataResponce.fromJson(Map<String, dynamic> json) =>
      UserDataResponce(
        status: json["status"],
        message: json["message"],
      );
}
