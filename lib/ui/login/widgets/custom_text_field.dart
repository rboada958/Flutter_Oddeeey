import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color successColor;
  final Color borderColor;
  final Color errorColor;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  final Function onChanged;
  final String route;

  CustomTextField(
      {this.hint,
      this.controller,
      this.onChanged,
      this.successColor,
      this.borderColor,
      this.errorColor,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.validator,
      this.route});

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: currentColor, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          onChanged: (text) {
            if (widget.onChanged != null) {
              widget.onChanged(text);
            }
            setState(() {
              if (!widget.validator(text) || text.length == 0) {
                currentColor = widget.errorColor;
              } else {
                currentColor = widget.successColor;
              }
            });
          },
          //keyboardType: widget.inputType,
          obscureText: widget.obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            icon: Image.asset(
              widget.route,
              width: 30.0,
              height: 30.0,
            ),
            hintStyle: TextStyle(
              color: widget.borderColor,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
            ),
            border: InputBorder.none,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
