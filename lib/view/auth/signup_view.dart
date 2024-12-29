import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parichay/res/common_widgets/CustomButton.dart';
import 'package:parichay/utils/utils.dart';
import 'package:parichay/view/auth/setup_profile_view.dart';
import 'package:parichay/res/common_widgets/rounded_Button.dart';
import 'package:parichay/view/home_view/home_view.dart';
import 'package:parichay/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/common_widgets/round_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    txtEmail.dispose();
    phoneNumber.dispose();
    txtPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Register to',
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
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "My phone number is",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    TextFormField(
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Set my password as",
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
                    SizedBox(
                      height: 20,
                    ),
                    // RoundButton(title: 'Sign up', onPress:() {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
                    // }),
                    RoundButton(
                      loading: authViewModel.signUpLoading,
                      onPress: () {
                        if (txtEmail.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter email', context);
                        } else if (phoneNumber.text.length < 10) {
                          Utils.flushBarErrorMessage(
                              'Phone number must be 10 digits', context);
                        } else if (txtPassword.text.length < 6) {
                          Utils.flushBarErrorMessage(
                              'Please enter 6 digit password', context);
                        } else {
                          Map data = {
                            "email": txtEmail.text.toString(),
                            "phoneNumber": phoneNumber.text.toString(),
                            "password": txtPassword.text.toString(),
                            "title": "Mr",
                            "fullName": "Raj Shukla",
                            "gender": "Male",
                            "dateOfBirth": "1997-08-20",
                            "address": "123 Main Street, City, Country",
                            "profession": "Developer",
                            "education": "Bachelor's Degree",
                            "caste": "Hindu",
                            "age": 27,
                            "height": "5'6\"",
                            "income": "10,000 per year",
                            "maritalStatus": "Married",
                            "religion": "Hindu",
                          };
                          authViewModel.signUpApi(json.encode(data), context);
                          print('Api hit');
                        }
                      }, title: 'Continue',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
