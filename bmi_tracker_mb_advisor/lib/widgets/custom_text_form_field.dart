// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String? hintTxt;
  TextInputType? keyboardType;

  // List<TextInputFormatter> inputFormatters;
  String? labelText;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixicon;
  bool? enable;
  double? borderRadius;
  Color fillColor;
  int? maxLines = 1;

  // bool isObscure;

  CustomTextFormField({
    Key? key,
    this.hintTxt,
    this.keyboardType,
    // this.inputFormatters,
    this.labelText,
    this.onSaved,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.maxLines,
    this.prefixicon,
    // this.isObscure = true,
    this.enable,
    this.borderRadius = 15,
    this.fillColor = const Color(0xfff5f5f5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable ?? true,
      enableInteractiveSelection: enable ?? true,
      // obscureText: isObscure,
      keyboardType: TextInputType.visiblePassword,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: prefixicon,
          filled: true,
          fillColor: fillColor,
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 221, 24, 17),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 221, 24, 17),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
          ),
          prefixIconColor: Theme.of(context).primaryColor,
          focusColor: Theme.of(context).primaryColor,
          suffixIcon: suffixIcon,
          hintText: hintTxt,
          labelText: labelText,
          suffixIconColor: Theme.of(context).primaryColor),
    );
  }
}
