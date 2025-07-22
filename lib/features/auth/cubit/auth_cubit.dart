
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/data/models/get_otp.dart';

import '../../../data/services/http_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  

 Future<void> getOtp(String phone) async {
    try {
      GetOtp response =
          await HttpServices.getOtp(phone);
      if (response.status == true) {
        emit(PhoneVerfied(response.message));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthFailure('Failed to fetch data: ${e.toString()}'));
    }
  }

  void verifyOtp(String otp,String phone) {
    if (otp == "111111") {
      emit(OtpVerified());
    } else {
      emit(OtpVerificationFailed());
    }
  }
}
