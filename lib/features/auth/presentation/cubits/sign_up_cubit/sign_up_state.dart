part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;

  SignUpSuccess({required this.userEntity});
}

final class SignUpFailure extends SignUpState {
  String message;

  SignUpFailure({required this.message});
}
