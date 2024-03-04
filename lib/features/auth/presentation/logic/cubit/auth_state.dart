part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthPhaseOne extends AuthState {}

final class AuthPhaseTwo extends AuthState {}

final class AuthLoadData extends AuthState {}

final class AuthLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class AuthSuccess extends AuthState {
  final LoginResponse loginResponse;

  AuthSuccess(this.loginResponse);

  @override
  List<Object> get props => [loginResponse];
}

final class SignupSuccess extends AuthState {
  final SignupResponse signupResponse;

  SignupSuccess(this.signupResponse);

  @override
  List<Object> get props => [signupResponse];
}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}
