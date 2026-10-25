import 'package:flutter/material.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

class CustomTexField extends StatefulWidget {
  final bool containObscureText;
  final bool isPasswordField;
  final TextEditingController controller;
  final String hint;
  final Widget? prefixIcon;
  final FocusNode focusNode;
  final String? errorText;
  final TextInputType? textInputType;
  final bool readOnly;
  final Widget? suffixIcon;
  final Function(String)? onSubmitted;

  const CustomTexField({
    super.key,
    this.containObscureText = false,
    this.isPasswordField = false,
    this.prefixIcon,
    required this.controller,
    required this.hint,
    required this.focusNode,
    this.errorText,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.suffixIcon,
    this.onSubmitted,
  });

  @override
  State<CustomTexField> createState() => _CustomTexFieldState();
}

class _CustomTexFieldState extends State<CustomTexField> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      style: TextStyle(
          fontFamily: 'Poppins',
          letterSpacing: 0,
          fontSize: 13.0,
          color: kcDarkGreyColor,
          fontWeight: FontWeight.w500),
      obscureText: widget.isPasswordField ? _isObscureText : false,
      decoration: InputDecoration(
          filled: widget.readOnly,
          fillColor: kcVeryLightGrey,
          contentPadding: const EdgeInsets.all(16.0),
          hintText: widget.hint,
          hintStyle: TextStyle(
              fontFamily: 'Poppins',
              letterSpacing: 0,
              fontSize: 13.0,
              color: kcLightGrey,
              fontWeight: FontWeight.normal),
          errorStyle: const TextStyle(height: 0.7, fontSize: 0),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField && widget.containObscureText
              ? IconButton(
                  onPressed: () {
                    _updateObscureText(!_isObscureText);
                  },
                  icon: _isObscureText
                      ? const Icon(
                          Icons.visibility_off,
                          color: kcLightGrey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: kcLightGrey,
                        ),
                )
              : widget.suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kcVeryLightGrey, width: 1.2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kcPrimaryColor, width: 1.2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 1.2),
          ),
          errorText: widget.errorText),
      onFieldSubmitted: widget.onSubmitted,
    );
  }

  void _updateObscureText(bool obs) {
    setState(() {
      _isObscureText = obs;
    });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
