import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/screens/login/login_api.dart';
import 'package:datn_test/screens/login/login_screen.dart';
import 'package:datn_test/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class ChanegPassWord extends StatefulWidget {
  const ChanegPassWord({super.key});

  @override
  State<ChanegPassWord> createState() => _ChanegPassWordState();
}

class _ChanegPassWordState extends State<ChanegPassWord> {
  TextEditingController passWordVC = TextEditingController(text: '');
  TextEditingController newPassWordVC = TextEditingController(text: '');
  TextEditingController confirmNewPassWordVC = TextEditingController(text: '');
  bool _obscureText = true;
  bool _obscureTextNewPass = true;
  bool _obscureTextConfirmNewPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text("Enter your old password",
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: passWordVC,
                      obscureText: _obscureText,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Enter your new password",
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: newPassWordVC,
                      obscureText: _obscureTextNewPass,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureTextNewPass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTextNewPass = !_obscureTextNewPass;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Confirm new password",
                      style: TextStyle(fontSize: 16.0, color: Colors.black)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      controller: confirmNewPassWordVC,
                      obscureText: _obscureTextConfirmNewPass,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: kPrimaryColor,
                        ),
                        hintText: "Confirm new password",
                        hintStyle: TextStyle(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureTextConfirmNewPass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTextConfirmNewPass =
                                  !_obscureTextConfirmNewPass;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SafeArea(
                child: GestureDetector(
              onTap: () {
                update();
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                    child: Text(
                  "Update",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void update() async {
    // if (nameVC.text == globals.fullName ||
    //     phoneNumberVC.text == globals.phoneNumber) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(""),
    //     ),
    //   );
    // }
    if (newPassWordVC.text != confirmNewPassWordVC.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Confirmation password does not match"),
        ),
      );
    }

    try {
      final id = await postUserChangePass(
          passWordVC.text, newPassWordVC.text, confirmNewPassWordVC.text);
      if (id == 1) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password change successful"),
          ),
        );
      }
    } catch (e) {
      throw (e);
    }
  }
}
