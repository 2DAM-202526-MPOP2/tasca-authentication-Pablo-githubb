import 'package:first_flutter/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthVM extends ChangeNotifier{
  final IAuthRepository _authRepository;

  AuthVM({required IAuthRepository authRepository}) : _authRepository = authRepository;
}