import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/features/auth/cubit/forgot_password_cubit.dart';

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
        // '/phoneNumberScreen': (context) => LoginScreen(),
        // '/otpScreen': (context) => const Home(),
        // '/messages': (context) => DashboardScreen(),
        // '/chats': (context) => ProjectList(),
      },
    );
  }
}
