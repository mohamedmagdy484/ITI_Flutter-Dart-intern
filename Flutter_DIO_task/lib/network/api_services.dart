import 'package:dio/dio.dart';
import 'package:flutter_winter_dio/model/product_model.dart';
import 'package:flutter_winter_dio/network/api_constants.dart';
import 'package:flutter_winter_dio/network/api_exception.dart';
import 'package:flutter_winter_dio/network/api_result.dart';
import 'package:flutter_winter_dio/network/dio_config.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices instance = ApiServices._();

  Future<ApiResult<ProductsModel>> fetchProducts() async {
    try {
      Dio dio = DioConfig.getDio();
      Response response = await dio.get(ApiConstants.productsEndPoint);
      if (response.statusCode == 200) {
        return Success(ProductsModel.fromJson(response.data));
      } else {
        return Failure(
          ApiException(
            message: 'Something went wrong, ${response.statusMessage}',
          ),
        );
      }
    } on DioException catch (e) {
      return Failure(handleError(e));
    } catch (e) {
      return Failure(ApiException(message: e.toString()));
    }
  }
}