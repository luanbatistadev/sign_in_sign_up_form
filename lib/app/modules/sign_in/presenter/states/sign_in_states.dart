abstract class SignInStates {}

class SignInInitial extends SignInStates {}

class SignInLoading extends SignInStates {}

class SignInSuccess extends SignInStates {}

class SignInError extends SignInStates {
  final String message;

  SignInError({required this.message});
}
