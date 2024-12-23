import 'package:flutter/material.dart';

import '../../../../core.dart';

class FormBoxWidget extends StatefulWidget {
  const FormBoxWidget({
    super.key,
    this.controller,
    required this.labelText,
    required this.maxLines,
    this.maxLength,
    this.focusNode,
    this.keyboardType,
    this.validator,
    this.icon,
    this.isPassword = false,
  });

  final TextEditingController? controller;
  final String labelText;
  final int maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? icon;
  final bool isPassword;

  @override
  State<FormBoxWidget> createState() => _FormBoxWidgetState();
}

class _FormBoxWidgetState extends State<FormBoxWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        obscureText: widget.isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          labelText: widget.labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : widget.icon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: textColor),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: widget.validator,
        onEditingComplete: () {
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}
