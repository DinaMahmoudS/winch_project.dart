import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/driver_login/states.dart';

class DrivLoginCubit extends Cubit<DrivLoginStates> {
  DrivLoginCubit() : super(DrivLoginInitialState());

  static DrivLoginCubit get(context) => BlocProvider.of(context);

  void DrivLogin({
    required String email,
    required String password,
  }) {
    emit(DrivLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(DrivLoginSuccessState());
    }).catchError((error) {
      emit(DrivLoginErrorState(error.toString()));
    });
  }
}
