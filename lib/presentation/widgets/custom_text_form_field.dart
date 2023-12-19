import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;
  final bool isObscure;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onPressed;
  
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.isObscure = true,
    this.keyboardType,
    this.padding,
    this.validator,
    this.onChanged,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: responsive.ip(1.6))),
          SizedBox(height: responsive.hp(1),),
          TextFormField(
            autocorrect: false,
            style: const TextStyle(color: Colors.white),
            obscureText: !isObscure,
            keyboardType: keyboardType,
            decoration: InputDecoration(    
              contentPadding: padding,
              prefixIcon: Icon(prefixIcon),
              hintText: label,
              suffixIcon: suffixIcon != null
              ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onPressed,
              )
              : null,
              errorText: errorText
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      );
  }
}