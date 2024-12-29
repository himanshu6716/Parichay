import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double fontSize;
  final Color color;
  final Color txtColor;
  final bool loading;

  const RoundedButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.fontSize,
    required this.color,
    required this.txtColor,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.red),
          color: color,
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(color: txtColor, fontSize: fontSize),
                ),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String icon;
  final Color? color;

  const RoundedIconButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  icon,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
