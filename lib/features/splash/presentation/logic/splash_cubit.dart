import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/helpers/local_storage.dart';
import '../../../../core/networking/api_constants.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final LocalStorage localStorage;
  SplashCubit({required this.localStorage}) : super(SplashInitial());

  Future<bool> checkIfUserLogged() async {
    String? token = await localStorage.readSecureData(ApiConstants.tokenKey);
    if (token != null && !token.contains('No data found!')) {
      return true;
    } else {
      return false;
    }
  }
}
