// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/phone_number_field.dart';
import '../../../core/constands/colors.dart';
import '../../../core/components/button.dart';
import '../../../core/components/snackbar.dart';
import '../cubit/auth_cubit.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});

  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is OtpSent) {
                  log(state.otp);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => OtpScreen(gOtp: "",),
                  //     ));
                  snackBar(context, state.message, Colors.green);
                } else if (state is AuthFailure) {
                  snackBar(context, state.message, Colors.red);
                }
              },
            ),
          ],
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        children: [
                          BackButtonWidget(),
                        ],
                      ),
                      const Text(
                        "Enter your phone\nnumber",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(height: 35),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return const PhoneNumberField();
                        },
                      ),
                       const Padding(
                         padding: EdgeInsets.only(left: 25.0,top: 8.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text(
                              "Fliq will send you a text with a verification code.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                fontFamily: "Poppins",
                              ),
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
                          if (context.mounted) {
                            if (phoneNumberController.text.isEmpty) {
                              snackBar(context, "Enter Valid Phone Number",
                                  Colors.red);
                            } else {
                              context
                                  .read<AuthCubit>()
                                  .verifyPhone(phoneNumberController.text);
                            }
                          }
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/otpScreen');
                          },
                          child: LargeButton(
                            title: "Next",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
