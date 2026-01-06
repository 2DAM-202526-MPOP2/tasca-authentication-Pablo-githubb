import 'package:first_flutter/data/models/profile.dart';
import 'package:first_flutter/data/services/profile_service.dart';

abstract class IAuthenticationRepository {
  Future<Profile> getProfile();
  Future<void> updateProfile(Profile profile);
  Future<void> deleteProfile();
  Future<void> logout();

  Future<Profile> validateProfile(
    String username,
    String id,
    String email,
    String firstname,
    String lastname,
    String birthdate,
  );
}

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({required IAuthenticationService authService})
    : _authService = authService;

  final IAuthenticationService _authService;

  @override
  Future<void> deleteProfile() {
    return _authService.deleteProfile();
  }

  @override
  Future<Profile> getProfile() {
    return _authService.getProfile();
  }

  @override
  Future<void> logout() {
    return _authService.logout();
  }

  @override
  Future<void> updateProfile(Profile profile) {
    return _authService.updateProfile(profile);
  }

  @override
  Future<Profile> validateProfile(
    String username,
    String id,
    String email,
    String firstname,
    String lastname,
    String birthdate,
  ) {
    return _authService.validateProfile(
      username,
      id,
      email,
      firstname,
      lastname,
      birthdate,
    );
  }
}
