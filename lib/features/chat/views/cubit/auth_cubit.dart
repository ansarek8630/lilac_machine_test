import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/data/models/get_otp.dart';
import '../../../../data/services/http_services.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> getOtp(String phone) async {
    try {
      GetOtp response = await HttpServices.getOtp(phone);
      if (response.status == true) {
        emit(PhoneVerfied(response.message, phone));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthFailure('Failed to fetch data: ${e.toString()}'));
    }
  }

  Future<void> verifyOtp(int otp, String phone) async {
      emit(AuthLoading());
    try {
      final response = await HttpServices.verifyOtp(otp, phone);
      if (response["id"] != "") {
        emit(OtpVerified());
      } else {
        emit(OtpVerificationFailed());
      }
    } catch (e) {
      log(e.toString());
      emit(OtpVerificationFailed());
    }
  }
}
