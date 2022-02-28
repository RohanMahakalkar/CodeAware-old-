import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final Color color;
  final String hintText;
  final String validator;
  final bool obscureText;
  final String width;
  final String textInputType;
  final String onChange;
  final String border;
  // final FormFieldValidator<String> validator;
  // final void Function(String) onSaved, onChange;

  const CustomTextForm({Key? key,
    required this.label,
    required this.hintText,
    required this.color,
    required this.validator,
    required this.obscureText,
    required this.width,
    required this.textInputType,
    required this.onChange,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        hintText: hintText,
        labelText: label,
      ),
      obscureText: obscureText,
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (value == null ) ? 'Please enter the data' : null;
      },
    );
  }
}