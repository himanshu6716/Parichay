import 'package:flutter/material.dart';
import 'package:parichay/res/common_widgets/round_button.dart';
import 'package:parichay/res/common_widgets/rounded_Button.dart';
import 'package:parichay/view/main_tabview/main_tabview.dart';

class SetUpProfileView extends StatefulWidget {
  const SetUpProfileView({super.key});

  @override
  State<SetUpProfileView> createState() => _SetUpProfileViewState();
}

class _SetUpProfileViewState extends State<SetUpProfileView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtGender = TextEditingController();
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtBirthdate = TextEditingController();
  TextEditingController txtCaste = TextEditingController();
  TextEditingController txtAddress = TextEditingController();

  TextEditingController txtEducation = TextEditingController();
  TextEditingController txtProfession = TextEditingController();
  TextEditingController txtIncome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tell us about you',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, My Name is",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I am",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              RoundDropDownTextFields(
                controller: txtGender,
                hintText: 'Select your gender',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "My height is",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              RoundDropDownTextFields(
                controller: txtHeight,
                hintText: 'Choose your height',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I born on",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextField(
                controller: txtBirthdate,
                decoration: InputDecoration(
                  hintText: 'Select your birthdate',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I belong to",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              RoundDropDownTextFields(
                controller: txtCaste,
                hintText: 'Select your caste',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I am living at",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              TextField(
                controller: txtAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Professional Info",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "I completed/persuing my study in",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  RoundDropDownTextFields(
                    controller: txtAddress,
                    hintText: 'Select Education Field',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "I am working as",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  RoundDropDownTextFields(
                    controller: txtAddress,
                    hintText: 'Select your profession',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "My monthly income is",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  TextField(
                    controller: txtAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your income',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainTabView()));
                      },
                      title: 'Continue',
                      fontSize: 14,
                      color: Colors.red,
                      txtColor: Colors.white)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
