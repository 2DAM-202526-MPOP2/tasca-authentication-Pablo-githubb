import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/services/auth_service.dart';


abstract class IAuthRepository{
  User get username;
  bool get authenticated;
  Future<User> validateLogin(String username, String password);

}

class AuthRepository implements IAuthRepository{
  AuthRepository({
    required IAuthenticationService authService,
  }) : _authenticationService = authService ;

  final IAuthenticationService _authenticationService;

  @override
  // TODO: implement authenticated
  bool get authenticated => throw UnimplementedError();

  @override
  // TODO: implement username
  User get username => throw UnimplementedError();
  
  @override
  Future<User> validateLogin(String username, String password) {
    // TODO: implement validateLogin
    throw UnimplementedError();
  }
  
}