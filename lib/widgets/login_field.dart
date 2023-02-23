// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_editing_app/constants/colors.dart';

class LoginFields extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  bool obSecure;
  // TextEditingController? formcontroller = TextEditingController();
  ValueChanged<String>? onChanged;
  // bool? obSecure;

  LoginFields({
    Key? key,
    this.border,
    this.errorBorder,
    this.focusBorder,
    // this.controller,
    this.enableBorder,
    this.contentPadding,
    this.style,
    this.hintStyle,
    this.fillColor = kwhite,
    this.hintText,
    this.onChanged,
    this.formcontroller,
    this.obSecure = false,
    this.suffixicon,
    this.prefixicon,
    this.fieldValidator,
    this.onSavedState,
    this.inputFormatters,
    this.keyboardType,
    this.enabled
  }) : super(key: key);

  Widget? suffixicon, prefixicon;
  String? hintText;
  String? Function(String?)? fieldValidator;
  Function? onSavedState;
  Color? fillColor;
  TextStyle? style;
  var hintStyle;
  EdgeInsetsGeometry? contentPadding;
  InputBorder? enableBorder;
  InputBorder? focusBorder;
  InputBorder? border;
  InputBorder? errorBorder;
  TextEditingController? formcontroller;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  bool? enabled;

  // create override for state
  @override
  State<LoginFields> createState() => _LoginFieldsState();

  // @override
  // State<_LoginFieldsState> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: widget.style,
      enabled: widget.enabled,
      obscureText: widget.obSecure,
      controller: widget.formcontroller,
      obscuringCharacter: "*",
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: '${widget.hintText}',
        prefixIcon: widget.prefixicon,
        suffixIcon: widget.suffixicon,
        // labelText: '${widget.hintText}',
        // labelStyle: khintStyle(),
        hintStyle: widget.hintStyle,
        contentPadding: widget.contentPadding,
        border: widget.border,
        enabledBorder: widget.enableBorder,
        focusedBorder: widget.focusBorder,
        errorBorder: widget.errorBorder,
        // enabledBorder: InputStyling.inputEnableBorder,
        // focusedBorder: InputStyling.inputFocusBorder,
        fillColor: widget.fillColor,
        filled: true,
      ),
      validator: widget.fieldValidator,
    );
  }
}
