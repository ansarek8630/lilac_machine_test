import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/components/button.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/bg_img.png"))),
      child: Padding(
        padding: const EdgeInsets.only(top: 110.0, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/fliq_icon.png"),
                  radius: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 43.0, vertical: 15),
                  child: Text(
                    "Connect. Meet. Love.\nWith Fliq Dating",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        decoration: TextDecoration.none, 
                        color: Colors.white),
                  ),
                )
              ],
            ),
            Column(
              children: [
                AuthButton(image: "assets/images/google_auth.png"),
                AuthButton(image: "assets/images/facebook_auth.png"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/phoneNumberScreen');
                  },
                  child: AuthButton(image: "assets/images/phone_auth.png")),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Terms',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: ' See how we use your data in our ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
