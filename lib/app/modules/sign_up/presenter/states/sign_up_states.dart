abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {}

class SignUpError extends SignUpStates {
  final String message;

  SignUpError({required this.message});
}
