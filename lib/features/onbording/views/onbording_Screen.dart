import 'package:flutter/material.dart';
import 'package:todo/features/onbording/widgets/onbording_body.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnbordingBody()
    );
  }
}