import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';
import './login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width(context),
                  minHeight: MediaQuery.of(context).size.height - 150,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/images/Photo_2.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "تسجيل الدخول",
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(height: 30),
                              LoginForm(),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 50),
                  child: Image.asset('assets/images/Photo_4.png'),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 50),
                  child: Image.asset('assets/images/Photo_3.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
