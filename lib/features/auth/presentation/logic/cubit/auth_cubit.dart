import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kafiil/core/helpers/local_storage.dart';
import 'package:kafiil/core/networking/api_constants.dart';
import 'package:kafiil/features/auth/data/models/login_body.dart';
import 'package:kafiil/features/auth/data/models/login_response.dart';
import 'package:kafiil/features/auth/data/models/signup_response.dart';
import 'package:kafiil/features/auth/domain/repos/auth_repo.dart';

import '../../../data/models/signup_body.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final LocalStorage localStorage;
  AuthCubit({required this.authRepo, required this.localStorage})
      : super(AuthInitial());
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  Future<void> login() async {
    emit(AuthLoading());

    var result = await authRepo.login(LoginBody(
      username: userNameController.text,
      password: passwordController.text,
      guest: false,
      rememberMe: true,
    ));
    result.fold(
      (l) => emit(AuthError(l)),
      (r) async {
        if (r?.accessToken != null) {
          await localStorage.writeSecureData(
              ApiConstants.tokenKey, r!.accessToken!);
          await localStorage.writeSecureData(
              ApiConstants.customerId, (r.customerId ?? 0).toString());
          emit(AuthSuccess(r));
        }
      },
    );
  }

  Future<void> signUp() async {
    emit(AuthLoading());

    var result = await authRepo.signup(SignupBody());
    result.fold(
      (l) => emit(AuthError(l)),
      (r) async {
        emit(SignupSuccess(r!));
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await localStorage.deleteSecureData(ApiConstants.tokenKey).then((x) {
      emit(LogoutSuccess());
    });
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
