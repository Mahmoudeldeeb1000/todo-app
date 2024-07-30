import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/utils/app_Images.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/onbording/widgets/onbording_body.dart';
import 'package:todo/features/regester/views/regester_Screen.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnbordingBody()
    );
  }
}