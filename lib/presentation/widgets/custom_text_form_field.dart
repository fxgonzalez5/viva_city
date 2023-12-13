import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool noVisibility; 
  final EdgeInsets? padding;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.label,
    required this.prefixIcon,
    this.suffixIcon,
    this.noVisibility = false,
    this.padding,
    this.validator,
    this.onChanged
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
            style: const TextStyle(color: Colors.white),
            obscureText: noVisibility,
            decoration: InputDecoration(    
              contentPadding: padding,
              prefixIcon: Icon(prefixIcon),
              hintText: label,
              suffixIcon: suffixIcon != null
              ? IconButton(
                icon: Icon(suffixIcon),
                onPressed:(){
                  //TODO: Permitir que se vea la contraseña
                  print("click");
                },
              )
              : null
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      );
  }
}