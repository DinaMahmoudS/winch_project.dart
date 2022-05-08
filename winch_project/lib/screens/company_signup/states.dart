abstract class ComSignupStates {}

class ComSignupInitialState extends ComSignupStates {}

class ComSignupLoadingState extends ComSignupStates {}

class ComSignupSuccessState extends ComSignupStates {}

class ComSignupErrorState extends ComSignupStates
{
  final String error;
  ComSignupErrorState(this.error);
}

class CreateComSuccessState extends ComSignupStates {}

class CreateComErrorState extends ComSignupStates
{
  final String error;
  CreateComErrorState(this.error);
}