import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  final ILoginRepository _authRepository;

  LoginVM({required ILoginRepository loginRepository})
    : _authRepository = loginRepository;

  User? _currentUser;

  String get username => _currentUser?.username ?? '';
  bool get authenticated => _currentUser?.authenticated ?? false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      _currentUser = await _authRepository.validateLogin(
        usernameController.text,
        passwordController.text,
      );
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
