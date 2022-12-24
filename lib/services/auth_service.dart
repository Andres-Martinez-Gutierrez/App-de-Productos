import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final _baseUrl = 'identitytoolkit.googleapis.com';
  final _firebaseToken =
      'AIzaSyBoQanLTq8mvcRIzMHM5-p2npG464rBwoE'; // Token de acceso al API a firebase
  final _storage = const FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    Map<String, dynamic> authDate = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authDate));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      //Se guarda el token en un lugar seguro
      await _storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    Map<String, dynamic> authDate = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final resp = await http.post(url, body: json.encode(authDate));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      //Se guarda el token en un lugar seguro
      await _storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
    return;
  }

  Future<String> readDate() async {
    return await _storage.read(key: 'token') ?? '';
  }
}
