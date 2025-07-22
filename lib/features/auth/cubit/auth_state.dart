part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class OtpSent extends AuthState {
  final String message;
  final String otp;

  OtpSent(this.message, this.otp);
}

class AuthTimerUpdated extends AuthState {
  final int secondsRemaining;
  final bool isResendButtonEnabled;

  AuthTimerUpdated(this.secondsRemaining, this.isResendButtonEnabled);
}

class PasswordVisibilityChanged extends AuthState {
  final bool isObscure;
  PasswordVisibilityChanged(this.isObscure);
}

class ConfirmPasswordVisibilityChanged extends AuthState {
  final bool confirmObscure;
  ConfirmPasswordVisibilityChanged(this.confirmObscure);
}

class OtpVerified extends AuthState {}

class OtpVerificationFailed extends AuthState {}
