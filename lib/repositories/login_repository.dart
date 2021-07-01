import 'package:login_bloc/providers/api/login_api_provider.dart';

class LoginRepository {
  final LoginApiProvider _apiProvider = LoginApiProvider();

  Future<String> loginButtonPressed(String email, String password) async {
    return await _apiProvider.loginButtonPressed(email, password);
  }
}
