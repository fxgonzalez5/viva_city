import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;
  final bool isObscure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(bool?)? onPhoneValidated;
  final Function(String)? onChanged;
  final Function(PhoneNumber)? onInputChanged;
  final VoidCallback? onPressed;
  
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.isObscure = true,
    this.keyboardType,
    this.validator,
    this.onPhoneValidated,
    this.onChanged,
    this.onInputChanged,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final style = TextStyle(color: Colors.white, fontSize: responsive.ip(1.6));
    final PhoneNumber number = PhoneNumber(isoCode: 'EC');

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: responsive.ip(1.6))),
          SizedBox(height: responsive.hp(1),),
          
          if (keyboardType != TextInputType.phone) 
            TextFormField(
              autocorrect: false,
              style: style,
              textAlignVertical: TextAlignVertical.center,
              obscureText: !isObscure,
              keyboardType: keyboardType,
              textCapitalization: keyboardType == TextInputType.name ? TextCapitalization.words : TextCapitalization.none,
              decoration: InputDecoration(    
                prefixIcon: Icon(prefixIcon, size: responsive.ip(2.5),),
                hintText: label,
                suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, size: responsive.ip(2.5),),
                    onPressed: onPressed,
                  )
                : null,
                errorText: errorText
              ),
              validator: validator,
              onChanged: onChanged,
            ) 
          else 
            InternationalPhoneNumberInput(
              initialValue: number,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
                setSelectorButtonAsPrefixIcon: true,
                leadingPadding: 15,
                trailingSpace: false,
                useBottomSheetSafeArea: true,
              ),
              textStyle: style,
              selectorTextStyle: style,
              hintText: label,
              searchBoxDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
                fillColor: Colors.white,
                hintText: 'Buscar por nombre de país',
                hintStyle: TextStyle(color: Colors.black38, fontSize: responsive.ip(1.6)),
              ),
              onInputValidated: onPhoneValidated,
              validator: validator,
              onInputChanged: onInputChanged,
            ),
        ],
      );
  }
}