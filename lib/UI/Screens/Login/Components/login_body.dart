import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaddah_household_survey/Resources/assets_manager.dart';
import 'package:jaddah_household_survey/Resources/colors.dart';
import 'package:jaddah_household_survey/Resources/sizes.dart';

import './login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      height: height(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.homeBackground),fit: BoxFit.fill
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width(context),
          minHeight: MediaQuery.of(context).size.height - 150,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 24,
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Image(image: AssetImage(ImageAssets.logo)),
                          ],
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
      ),
    );
  }
}
