import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/company_login/states.dart';

class ComLoginCubit extends Cubit<ComLoginStates> {
  ComLoginCubit() : super(ComLoginInitialState());

  static ComLoginCubit get(context) => BlocProvider.of(context);

  void ComLogin({
    required String email,
    required String password,
  }) {
    emit(ComLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(ComLoginSuccessState());
    }).catchError((error) {
      emit(ComLoginErrorState(error.toString()));
    });
  }
}
