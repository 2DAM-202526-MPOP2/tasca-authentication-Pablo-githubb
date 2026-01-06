import 'dart:convert';

import 'package:first_flutter/data/models/profile.dart';
import 'package:http/http.dart' as http;

abstract class IAuthenticationService {
  Future<Profile> getProfile();
  Future<void> logout();
  Future<void> deleteProfile();
  Future<Profile> updateProfile(Profile profile);

  Future<Profile> validateProfile(
    String username,
    String id,
    String email,
    String firstname,
    String lastname,
    String birthdate,
  );
}

class AuthenticationService implements IAuthenticationService {
  @override
  Future<Profile> getProfile() async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Profile.');
    }
  }

  @override
  Future<void> deleteProfile() async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete Profile.');
    }
  }

  @override
  Future<void> logout() async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to logout.');
    }
  }

  @override
  Future<Profile> updateProfile(Profile profile) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.put(url);
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Profile.');
    }
  }

  @override
  Future<Profile> validateProfile(
    String username,
    String id,
    String email,
    String firstname,
    String lastname,
    String birthdate,
  ) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to validate Profile.');
    }
  }
}
