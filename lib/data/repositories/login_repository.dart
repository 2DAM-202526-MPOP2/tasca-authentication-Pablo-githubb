import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/services/login_service.dart';

abstract class ILoginRepository {
  User get username;
  bool get authenticated;
  Future<User> validateLogin(String username, String password);
}

class LoginRepository implements ILoginRepository {
  LoginRepository({required ILoginService loginService})
    : _loginService = loginService;

  final ILoginService _loginService;
  User? _user;

  //Retorna true si hi ha un usuari i la seva propietat authenticated és certa
  @override
  bool get authenticated {
    return _user == null || !_user!.authenticated ? false : true;
  }

  @override
  User get username {
    if (_user == null) {
      throw Exception('User not authenticated');
    }
    return _user!;
  }

  @override
  Future<User> validateLogin(String username, String password) async {
    _user = await _loginService.validateLogin(username, password);
    return _user!;
  }
}
