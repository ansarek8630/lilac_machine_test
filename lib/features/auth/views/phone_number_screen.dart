// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/features/auth/views/otp_screen.dart';
import '../../../core/constands/colors.dart';
import '../../../core/components/button.dart';
import '../../../core/components/snackbar.dart';
import '../cubit/auth_cubit.dart';

class PhoneNumberScreen extends StatefulWidget {
  PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final phoneNumberController = TextEditingController();

  String selectedCountryCode = '+91';
  List<String> countryCodes = [
    '+1', // United States / Canada
    '+44', // United Kingdom
    '+91', // India
    '+971', // United Arab Emirates
    '+61', // Australia
    '+81', // Japan
    '+49', // Germany
    '+33', // France
    '+86', // China
    '+92', // Pakistan
  ];

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
                if (state is PhoneVerfied) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(),));
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.phone_android,
                                    color: Colors.grey[700]),
                                const SizedBox(width: 8),
                                DropdownButton<String>(
                                  value: selectedCountryCode,
                                  underline: const SizedBox(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  items: countryCodes.map((String code) {
                                    return DropdownMenuItem<String>(
                                        value: code, child: Text(code));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCountryCode =
                                          value ?? selectedCountryCode;
                                    });
                                  },
                                ),
                                const VerticalDivider(
                                    width: 16,
                                    thickness: 1,
                                    color: Colors.grey),
                                Expanded(
                                  child: TextField(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      hintText: 'Mobile number',
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 8.0),
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
                              context.read<AuthCubit>().getOtp(
                                  selectedCountryCode +
                                      phoneNumberController.text);
                            }
                          }
                        },
                        child: LargeButton(
                          title: "Next",
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
