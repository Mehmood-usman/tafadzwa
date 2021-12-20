import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final error;
  final String label;
  final String hint;
  final bool isSecure;
  final IconData? icon;
  final  Function(String)? onChange;
  final TextInputType inputType;
  final String? Function(String?)? validate;

  const TextInput(
      {required this.controller,
        this.error = "",
        required this.label,
        this.hint = "",
        this.isSecure = false,
        this.icon,
        required this.onChange,
        this.validate,
        this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecure,
      onChanged: onChange,
      keyboardType: inputType,
      validator: validate,
      style:const TextStyle(fontSize: 18),
      decoration: InputDecoration(
          border:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          labelStyle:const TextStyle(color: Colors.black),
          suffixStyle:const TextStyle(color: Colors.black),
          contentPadding:const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          labelText: label,
          suffixIcon: Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          errorText: error,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          )),
    );
  }
}

class GeneralButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  const GeneralButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
      ),
    );
  }
}
