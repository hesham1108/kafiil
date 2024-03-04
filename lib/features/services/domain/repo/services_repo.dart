import '../../data/web_services/services_service.dart';

class ServiceRepo {
  final ServicesService productService;

  ServiceRepo({required this.productService});

  // Future<Either<String, List<ProductModel>?>> getProducts(
  //     {required int categoryId}) async {
  //   try {
  //     final response = await productService.getServices();
  //     return right(response!.services);
  //   } catch (e) {
  //     return left(e.toString());
  //   }
  // }
}
