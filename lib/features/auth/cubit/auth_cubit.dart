import 'dart:async';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String genOtp = "";



  

  void verifyPhone(String phone) async {
    // if (otp == genOtp) {
    await sendOtp(phone);
    // } else {
    //   emit(AuthFailure("failed"));
    // }
  }

  Future<void> sendOtp(String username) async {
    try {
      final random = Random();
      genOtp = (1000 + random.nextInt(9000)).toString();
      emit(OtpSent("Otp sent to your WhatsApp", genOtp));
    } catch (e) {
      emit(AuthFailure("Failed to send OTP. Please try again."));
    }
  }



  void verifyOtp(String otp) {
    if (otp == "111111") {
      emit(OtpVerified());
    } else {
      emit(OtpVerificationFailed());
    }
  }
}
