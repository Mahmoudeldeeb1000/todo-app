import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/utils/app_Images.dart';
import 'package:todo/core/utils/app_colors.dart';
import 'package:todo/core/utils/app_texts.dart';
import 'package:todo/features/home/views/home_screen.dart';
import 'package:todo/features/regester/widgets/regester_body.dart';

class RegesterScreen extends StatelessWidget {
  const RegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegesterBody()
    );
  }
}
