abstract class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninInProgress extends SigninState {}

final class SigninSuccess extends SigninState {}

final class SigninFailure extends SigninState {
  final String message;

  SigninFailure({required this.message});
}
