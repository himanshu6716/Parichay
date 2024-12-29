import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
              color: Colors.white,
            )
                : Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}

// class RoundTextFields extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final Color? bgColor;
//   final Widget? left;
//   const RoundTextFields(
//       {super.key,
//       required this.controller,
//       required this.hintText,
//       this.keyboardType,
//       this.obscureText = false,
//       this.bgColor,
//       this.left});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(fontSize: 14),
//       ),
//     );
//   }
// }

class RoundDropDownTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Color? color;
  final Widget? left;

  const RoundDropDownTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.color,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: Icon(Icons.arrow_drop_down)),
    );
  }
}

// class RoundDropDownTextFields extends StatefulWidget {
//   const RoundDropDownTextFields({super.key});
//
//   @override
//   State<RoundDropDownTextFields> createState() =>
//       _RoundDropDownTextFieldsState();
// }
//
// class _RoundDropDownTextFieldsState extends State<RoundDropDownTextFields> {
//   @override
//   Widget build(BuildContext context) {
//     String? dropdownValue;
//     return DropdownButtonFormField<String>(
//       hint: const Text('Select your favourite fruit'),
//       value: dropdownValue,
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValue = newValue!;
//         });
//       },
//       items: <String>['Apple', 'Mango', 'Banana', 'Peach']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
