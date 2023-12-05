import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool noVisibility; 
  const CustomTextFormField({super.key, required this.title, required this.label, required this.prefixIcon, this.suffixIcon, this.noVisibility=false});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 16,
            ),
          ),
          const SizedBox(height: 5,),
          
          TextFormField(
            style: const TextStyle(color: Colors.white ),
            obscureText: noVisibility,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffFFFFFF).withOpacity(0.20),
              focusedBorder:  UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: const Color(0xffFFFFFF).withOpacity(0.20),
                  )
              ),
              enabledBorder:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none
              ),                    
              labelText: label, 
                labelStyle: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 12,
                ),
                prefixIcon: Icon(prefixIcon, color: Colors.white,),
                suffixIcon: IconButton(onPressed:(){
                  //TODO: Permitir que se vea la contraseña
                  print("click");
                },
                icon: Icon(suffixIcon), color: Colors.white,)
            ),
          ),
        ],
      );
  }
}