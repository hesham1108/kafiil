import 'package:dartz/dartz.dart';
import 'package:kafiil/features/auth/data/models/login_body.dart';
import 'package:kafiil/features/auth/data/models/login_response.dart';
import 'package:kafiil/features/auth/data/models/signup_body.dart';
import 'package:kafiil/features/auth/data/models/signup_response.dart';
import 'package:kafiil/features/auth/data/web_services/auth_service.dart';

class AuthRepo {
  final AuthService authService;

  AuthRepo({required this.authService});

  Future<Either<String, LoginResponse?>> login(LoginBody loginBody) async {
    try {
      final response = await authService.login(loginBody);
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, SignupResponse?>> signup(SignupBody signupBody) async {
    try {
      final response = await authService.signup(signupBody);
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}
