
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title,  this.icon, this.colors,});

  final void Function()? onPressed;
  final String title;
  final IconData?  icon ;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: colors!
          )
      ),
      child: MaterialButton(
        onPressed:onPressed ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: const TextStyle(color: Colors.white),),
            const SizedBox(width: 8,),
            icon == null ? const SizedBox():   Icon(icon,color: AppColor.white,)

          ],
        ),
      ),
    );
  }
}