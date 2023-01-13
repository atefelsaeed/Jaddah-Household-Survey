import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/api_helper.dart';
import '../Models/user.dart';


class Auth with ChangeNotifier {
  bool _isAuth = false;
  List<User> _users = [];
  User? _user;
  bool logout() {
    if (_user != null) {
      SharedPreferences.getInstance().then((value) {
        value.remove("user");
        _isAuth = false;
      });
      _user = null;
    }
    notifyListeners();
    return true;
  }

  bool get isAuth {
    return _isAuth;
  }

  int get uid {
    if (_isAuth) {
      return _user!.id;
    } else {
      return -1;
    }
  }

  User? get user {
    return _user;
  }

  Map<String, String> get authHeader {
    if (_isAuth) {
      // return {"Authorization": "Bearer ${_user!.token}"};
      return {"Authorization": "Bearer"};
    } else {
      return {};
    }
  }

  Future<bool> fetch() async {
    try {
      var response = await APIHelper.getData(
        url: "getUsers",
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        if (!data['status']) return false;
        _users = (data['data'] as List).map((e) => User.fromJson(e)).toList();
        final prefs = await SharedPreferences.getInstance();
        prefs.setStringList(
          "users",
          _users.map((e) => json.encode(e.toJson())).toList(),
        );
        return true;
      }
      return false;
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("users")) return false;
      _users = prefs
          .getStringList("users")!
          .map((e) => User.fromJson(json.decode(e)))
          .toList();
      return true;
    }
  }

  Future<bool> login(String? email, String? password) async {
    _isAuth = false;
    print("trying");
    _users.forEach((element) {
      print(element.toJson());
    });
    for (User u in _users) {
      if (u.email == email) {
        if (u.password == password) {
          _isAuth = true;
          _user = u;
          final prefs = await SharedPreferences.getInstance();
          prefs.setString(
            "user",
            json.encode(_user?.toJson()),
          );
          notifyListeners();
          break;
        }
      }
    }
    return _isAuth;
  }

  Future<bool> tryAutoLogin() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("user")) return false;
    final userData = json.decode(prefs.getString("user")!);
    _user = User.fromJson(userData);
    _isAuth = true;
    notifyListeners();
    return true;
  }
}
