import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winch_project/screens/company_signup/states.dart';
import 'package:winch_project/screens/models/user_model.dart';



class ComSignupCubit extends Cubit<ComSignupStates> {
  ComSignupCubit() : super(ComSignupInitialState());

  static ComSignupCubit get(context) => BlocProvider.of(context);

  void ComSignup({

    required String password,
    required String name,
    required String email,
    required String number,
    required String company_address,

  }) {
    emit(ComSignupLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value) {
      print(password);

      ComCreate(
          email: email,
          name: name,
          number: number,
          company_address: company_address,
          password: password,
          uId: value.user!.uid);

      emit(ComSignupSuccessState());
    })
        .catchError((error) {
      print(email);

      emit(ComSignupErrorState(error.toString()));
    });
  }

  void ComCreate({
    required String email,
    required String name,
    required String number,
    required String company_address,
    required String password,
    required String uId,

  })
  {
    ComModel model = ComModel(
        email: email,
        name: name,
        number: number,
        company_address: company_address,
        password: password,
        uId: uId
    );

    FirebaseFirestore.instance
        .collection('company details')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(CreateComSuccessState());
    })
        .catchError((error){
          emit(CreateComErrorState(error.toString()));
    });
  }

}