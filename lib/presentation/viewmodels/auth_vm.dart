import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier {
  final IAuthRepository _authRepository;

  AuthVM({required IAuthRepository authRepository})
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
}
