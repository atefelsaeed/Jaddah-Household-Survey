// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import 'package:provider/provider.dart';

import '../../../../Helper/validator.dart';
import '../../../../Providers/auth.dart';
import '../../../../Resources/colors.dart';

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
          Row(
            children: [
              Icon(
                Icons.phone_in_talk_outlined,
                color: ColorManager.grayColor,
              ),
              AppSize.spaceWidth1(context),
              Text(
                'Enter Phone',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width(context) * .04,
                ),
              ),
            ],
          ),
          AppSize.spaceHeight1(context),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.5, color: ColorManager.primaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: ColorManager.error),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Enter Phone"),
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator.validateEmail(
              value: value!,
              message: "Invalid Phone Number",
            ),
          ),
          AppSize.spaceHeight3(context),
          Row(
            children: [
              Icon(
                Icons.vpn_key_outlined,
                color: ColorManager.grayColor,
              ),
              AppSize.spaceWidth1(context),
              Text(
                'Enter Password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width(context) * .04,
                ),
              ),
            ],
          ),
          AppSize.spaceHeight1(context),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  // borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.5, color: ColorManager.primaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: ColorManager.error),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Enter Password"),
            textDirection: TextDirection.ltr,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) => Validator.validatePassword(
              value: value!,
              message: "Incorrect password",
            ),
          ),
          const SizedBox(height: 30),
          MaterialButton(
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
                          const Text("Verify your data"),
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
                        Text("Connection Error"),
                      ],
                    ),
                  );
                }
              }

              if (_formKey.currentState!.validate()) {
                _auth.login(email.text, password.text);
              }
            },
            color: ColorManager.primaryColor,
            child: Text(
              "LOGIN NOW",
              style: TextStyle(
                color: ColorManager.wight,
                fontWeight: FontWeight.w700,
              ),
            ),
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
