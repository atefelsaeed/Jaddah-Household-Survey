// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Helper/validator.dart';
import '../../../../Providers/auth.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    try {
      _auth.fetch();
    } catch (e) {}

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: email,
            decoration: const InputDecoration(labelText: "البريد الإلكتروني"),
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator.validateEmail(
              value: value!,
              message: "بريد إلكتروني غير صحيح",
            ),
          ),
          TextFormField(
            controller: password,
            decoration: const InputDecoration(labelText: "كلمة المرور"),
            textDirection: TextDirection.ltr,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) => Validator.validatePassword(
              value: value!,
              message: "كلمة مرور غير صحيحة",
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showCustomDialog(
                  context,
                  SizedBox(
                    height: 220,
                    child: WillPopScope(
                      onWillPop: () async => false,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                );
                try {
                  final output = await Provider.of<Auth>(context, listen: false)
                      .login(email.text, password.text);
                  Navigator.of(context).pop();
                  if (!output) {
                    showCustomDialog(
                      context,
                      Column(
                        children: [
                          Center(
                            child: Transform.rotate(
                              angle: 0.785398,
                              child: const Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 150,
                              ),
                            ),
                          ),
                          const Text("تأكد من بياناتك"),
                        ],
                      ),
                    );
                  } else {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(SurveysScreen.routeName);
                  }
                } catch (e) {
                  print(e);
                  Navigator.of(context).pop();
                  showCustomDialog(
                    context,
                    Column(
                      children: const [
                        Center(
                          child: Icon(
                            Icons.wifi_off,
                            size: 150,
                          ),
                        ),
                        Text("خطأ بالأتصال"),
                      ],
                    ),
                  );
                }
              }

              if (_formKey.currentState!.validate()) {
                _auth.login(email.text, password.text);
              }
            },
            child: const Text("دخول"),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showCustomDialog(BuildContext context, Widget content) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        content: SizedBox(
          height: 220,
          child: content,
        ),
      ),
    );
  }
}
