// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constands/colors.dart';

class LargeButton extends StatelessWidget {
  String title;
  LargeButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryColor,
        image: const DecorationImage(
            image: AssetImage("assets/images/appbar.png"),
            fit: BoxFit.fitWidth),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 6,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  String image;
  AuthButton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 25),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: AppColors.primaryColor,
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fitWidth),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 6,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        
      ),
    );
  }
}