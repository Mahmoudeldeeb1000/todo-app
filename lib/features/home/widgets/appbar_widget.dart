import 'dart:io';
import 'package:flutter/material.dart';

import 'package:todo/core/utils/app_Images.dart';
import 'package:todo/core/utils/app_colors.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.name, required this.photo});
  final String? name;
  final File? photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 12),
      color: Theme.of(context).indicatorColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child:Image.asset(AppImages.menu)
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 "Hellow",
                    style: Theme.of(context).textTheme.labelMedium
                ),
                Text(
                    name!,
                    style: Theme.of(context).textTheme.displayMedium
                ),
                const SizedBox(height: 12),
                Text(DateTime.now().toString().split(" ")[0],style: TextStyle( color: AppColor.white),),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: Image.file(photo!,fit: BoxFit.fill,).image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}