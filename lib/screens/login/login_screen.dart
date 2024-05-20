import 'dart:convert';

import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:datn_test/globals.dart' as globals;
import '../../constants/route.dart';
import '../../globals.dart';
import '../../widgets/home_item.dart';
import '../../widgets/page_title_bar.dart';
import '../../widgets/upside.dart';
import 'login_api.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 20,
              ),
              const Upside(
                imgUrl: "assets/icons/login.png",
              ),
              const PageTitleBar(title: 'Login to your account'),
              Padding(
                padding: const EdgeInsets.only(top: 320.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      iconButton(context),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "or use your email account",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      Form(
                        child: Column(
                          children: [
                            RoundedInputField(
                              hintText: "Email",
                              icon: Icons.email,
                              controller: emailController,
                            ),
                            RoundedPasswordField(
                              controller: passwordController,
                            ),
                            RoundedButton(
                              text: 'LOGIN',
                              press: () {
                                validateAndSubmit(
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      RoundedIcon(imageUrl: "assets/icons/facebook.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/icons/google.jpg"),
    ],
  );
}
