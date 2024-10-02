import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:customer_app/DB/super_main.dart';
import 'package:customer_app/data_layer/auth_layer.dart';
import 'package:customer_app/models/user_model.dart';
import 'package:customer_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final locator = authLocator.get<AuthLayer>();
  final db = SuperMain().supabase;
  TextEditingController emailCon = TextEditingController();
  TextEditingController firstNameCon = TextEditingController();
  TextEditingController lastNameCon = TextEditingController();

  String otp = "";
  AuthCubit() : super(AuthInitial());

  singup() async {
    try {
      emit(LoadingState());
      if (formKey.currentState!.validate()) {
        await SuperMain().createLogin(email: emailCon.text);

        log('Form is valid, proceed with signup');
        emit(SuccessState());
      } else {
        emit(NoLoadingState());
        log('Form is invalid');
      }
    } catch (er) {
      log("in signup error");
      log("$er");

      emit(ErrorState(msg: er.toString()));
    }
  }

  otpCheck(
      {required String email,
      required String? fName,
      required String? lName}) async {
    try {
      emit(LoadingState());
      if (otp.isEmpty) {
        emit(ErrorState(msg: "enter otp first"));
        return;
      }

      await SuperMain()
          .verifyOtp(email: email, otp: otp, fName: fName, lName: lName);
      final userFromDB = await db
          .from('customer')
          .select()
          .eq('customer_id', db.auth.currentUser!.id)
          .single();

      locator.saveAuth(
          userData: UserModel(
              customerId: userFromDB['customer_id'],
              email: db.auth.currentUser!.email!,
              firstName: userFromDB['first_name'],
              lastName: userFromDB['last_name']));
      emit(SuccessState());
    } catch (er) {
      log("$er");

      emit(ErrorState(msg: er.toString()));
    }
  }
}
