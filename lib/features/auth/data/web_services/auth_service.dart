import 'package:dio/dio.dart';
import 'package:kafiil/core/networking/api_constants.dart';
import 'package:kafiil/features/auth/data/models/login_body.dart';
import 'package:kafiil/features/auth/data/models/login_response.dart';
import 'package:kafiil/features/auth/data/models/signup_body.dart';
import 'package:kafiil/features/auth/data/models/signup_response.dart';

class AuthService {
  final Dio dio;

  AuthService({required this.dio});

  Future<LoginResponse?> login(LoginBody loginBody) async {
    final response =
        await dio.post(ApiConstants.login, data: loginBody.toJson());
    return LoginResponse.fromJson(response.data);
  }

  Future<SignupResponse?> signup(SignupBody signupBody) async {
    final response =
        await dio.post(ApiConstants.signup, data: signupBody.toJson());
    return SignupResponse.fromJson(response.data);
  }

  Future<void> getUserTypes() async {
    final response = await dio.get(ApiConstants.userTypes);
  }
}
