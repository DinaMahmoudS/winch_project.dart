
abstract class ComLoginStates {}

class ComLoginInitialState extends ComLoginStates {}

class ComLoginLoadingState extends ComLoginStates {}

class ComLoginSuccessState extends ComLoginStates {}

class ComLoginErrorState extends ComLoginStates
{
  final String error;
  ComLoginErrorState(this.error);
}

