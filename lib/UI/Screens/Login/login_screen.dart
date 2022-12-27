import 'package:flutter/material.dart';

import 'Components/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "login-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تطوير أنظمة تخطيط النقل"),
      ),
      body: const LoginBody(),
    );
  }
}
