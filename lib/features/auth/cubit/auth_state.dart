part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class PhoneVerfied extends AuthState {
  final String message;

  PhoneVerfied(this.message);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class OtpVerified extends AuthState {}

class OtpVerificationFailed extends AuthState {}
