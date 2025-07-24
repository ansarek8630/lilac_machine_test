// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constands/colors.dart';
import '../../../core/components/button.dart';
import '../../../core/components/snackbar.dart';
import '../cubit/auth_cubit.dart';
import '../../../core/components/otp_field.dart';

class OtpScreen extends StatelessWidget {
  String phone;
  OtpScreen({
    super.key,
    required this.phone
  });

  final TextEditingController f1 = TextEditingController();
  final TextEditingController f2 = TextEditingController();
  final TextEditingController f3 = TextEditingController();
  final TextEditingController f4 = TextEditingController();
  final TextEditingController f5 = TextEditingController();
  final TextEditingController f6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: MultiBlocListener(
              listeners: [
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is OtpVerified) {
                      Navigator.pushReplacementNamed(context, '/messages');
                    } 
                  },
                ),
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          BackButtonWidget(),
                        ],
                      ),
                      const Text(
                        "Enter your verification\ncode",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpField(f1, true),
                            OtpField(f2, false),
                            OtpField(f3, false),
                            OtpField(f4, false),
                            OtpField(f5, false),
                            OtpField(f6, false),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text:
                              'Didn’t get anything? No worries, let’s try again.\n',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Resend',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                        onTap: () async {
                          final otp = f1.text +
                              f2.text +
                              f3.text +
                              f4.text +
                              f5.text +
                              f6.text;

                          if (otp.length != 6) {
                            snackBar(context, "Enter valid OTP", Colors.red);
                          } else {
                            context.read<AuthCubit>().verifyOtp(int.parse(otp),phone);
                          }
                        },
                        child: LargeButton(
                          title: "Verify",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
