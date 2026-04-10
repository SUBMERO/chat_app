import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final String hint;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      style: AppTextStyle.openSans20Bold.copyWith(
        color: AppColors.kSecondaryColor,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : const Icon(Icons.email, color: AppColors.kSecondaryColor),

        hint: Text(
          widget.hint,
          style: AppTextStyle.openSans20Bold.copyWith(
            color: AppColors.kLightColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kLightColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kSecondaryColor, width: 3),
        ),

        fillColor: Colors.white24,
        filled: true,
      ),
    );
  }
}
