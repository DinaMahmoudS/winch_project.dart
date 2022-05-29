
abstract class DrivLoginStates {}

class DrivLoginInitialState extends DrivLoginStates {}

class DrivLoginLoadingState extends DrivLoginStates {}

class DrivLoginSuccessState extends DrivLoginStates {}

class DrivLoginErrorState extends DrivLoginStates
{
  final String error;
  DrivLoginErrorState(this.error);
}

