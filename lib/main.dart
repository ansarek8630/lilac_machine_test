import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/features/auth/cubit/auth_cubit.dart';
import 'package:lilac_machine_test/features/auth/views/otp_screen.dart';
import 'package:lilac_machine_test/features/auth/views/phone_number_screen.dart';
import 'package:lilac_machine_test/features/chat/views/chats.dart';
import 'package:lilac_machine_test/features/chat/views/messages.dart';

import 'core/constands/colors.dart';
import 'features/splash/views/splash.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => AuthCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Test Lilac',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/phoneNumberScreen': (context) => PhoneNumberScreen(),
        '/otpScreen': (context) => OtpScreen(),
        '/messages': (context) => Messages(),
        '/chats': (context) => const ChatScreen(),
      },
    );
  }
}
