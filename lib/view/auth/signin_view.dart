import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parichay/view/auth/forgetpassword_view.dart';
import 'package:parichay/view/auth/signup_view.dart';
import 'package:parichay/res/common_widgets/round_button.dart';
import 'package:parichay/res/common_widgets/rounded_Button.dart';
import 'package:parichay/view/home_view/home_view.dart';
import 'package:parichay/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Sign in to',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/love_1.jpg",
                        ),
                      ),
                      const Text(
                        'Parichay',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Email Address is",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    TextFormField(
                      controller: txtEmail,
                      decoration: const InputDecoration(
                        hintText: 'E-Mail',
                        labelText: 'E-Mail',
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Shssss,my Password is",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    TextFormField(
                      controller: txtPassword,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPassword()));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                      title: 'Login',
                      loading: authViewModel.loading,
                      onPress: () {
                        if (txtEmail.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter email', context);
                        }else if (txtPassword.text.isEmpty) {
                          Utils.flushBarErrorMessage('Please enter password', context);
                        } else if (txtPassword.text.length < 6) {
                          Utils.flushBarErrorMessage(
                              'Please enter 6 digit password', context);
                        } else {
                          Map data = {
                            "email": txtEmail.text.toString(),
                            "password": txtPassword.text.toString(),
                          };
                          authViewModel.loginApi(json.encode(data), context);
                          print('Api hit');
                        }
                      },
                    ),

                    // RoundedButton(
                    //   onPressed: () {
                    //     print("email ${txtEmail.text}");
                    //     print("password ${txtPassword.text}");
                    //     APIInterface()
                    //         .loginFunc(txtEmail.text, txtPassword.text);
                    //
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) => const HomeView()));
                    //   },
                    //   title: 'Sign in',
                    //   color: Colors.red,
                    //   txtColor: Colors.white,
                    //   fontSize: 14,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Oh! Not Registered yet?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                      },
                      title: 'Register Now',
                      color: Colors.white,
                      txtColor: Colors.red,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
