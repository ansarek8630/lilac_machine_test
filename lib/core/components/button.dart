// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constands/colors.dart';

class LargeButton extends StatelessWidget {
  String title;
  LargeButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.88,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: AppColors.primaryColor,
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

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16.0,bottom: 16,top: 60),
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white10,
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}