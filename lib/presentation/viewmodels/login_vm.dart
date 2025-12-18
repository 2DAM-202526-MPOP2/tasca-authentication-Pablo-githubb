import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  final ILoginRepository _authRepository;

  LoginVM({required ILoginRepository authRepository})
    : _authRepository = authRepository;

  late User _username;
  late User _authenticated;
  late User _email;
  late User _id;
  late User _accesToken;

  User get username => _username;
  User get authenticated => _authenticated;
  User get id => _id;
  User get email => _email;
  User get accesToken => _accesToken;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      _username = await _authRepository.validateLogin(
        usernameController.text,
        passwordController.text,
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    _username = User(username: '', authenticated: false);
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
