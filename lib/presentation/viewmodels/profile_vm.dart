import 'package:first_flutter/data/models/profile.dart';
import 'package:first_flutter/data/repositories/profile_repository.dart';
import 'package:flutter/material.dart';

class ProfileVmM extends ChangeNotifier {
  final IAuthenticationRepository _authRepository;

  ProfileVmM({required IAuthenticationRepository authRepository})
    : _authRepository = authRepository;

  Profile? _profile;

  Profile? get profile => _profile;

  Future<void> setProfile(Profile profile) async {
    _profile = profile;
    notifyListeners();
  }

  Future<Profile> getProfile() async {
    return _authRepository.getProfile();
  }

  Future<void> updateProfile(Profile profile) async {
    return _authRepository.updateProfile(profile);
  }

  Future<void> deleteProfile() async {
    return _authRepository.deleteProfile();
  }

  Future<void> logout() async {
    return _authRepository.logout();
  }

  Future<Profile> validateLogin(
    String username,
    String id,
    String email,
    String firstname,
    String lastname,
    String birthdate,
  ) async {
    return _authRepository.validateProfile(
      username,
      id,
      email,
      firstname,
      lastname,
      birthdate,
    );
  }
}
