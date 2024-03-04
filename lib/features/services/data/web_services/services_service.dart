import 'package:dio/dio.dart';

class ServicesService {
  final Dio dio;

  ServicesService({required this.dio});
  //
  // Future<LoginResponse?> getServices() async {
  //   final response =
  //       await dio.post(ApiConstants.login, data: loginBody.toJson());
  //   return LoginResponse.fromJson(response.data);
  // }
}
