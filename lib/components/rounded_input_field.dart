import 'package:flutter/material.dart';
import 'package:iscan/components/text_field_container.dart';
import 'package:iscan/utils/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator; // Add validator parameter

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.keyboardType,
    required this.onChanged,
    this.validator, // Add validator parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        // Use TextFormField for validation support
        onChanged: onChanged,
        validator: validator, // Pass validator to TextFormField
        cursorColor: kPrimaryColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(Icons.email, color: kPrimaryColor),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
