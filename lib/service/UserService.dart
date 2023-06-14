import 'package:dio/dio.dart';
import 'package:provider_app/core/config/network_config_response.dart';
import 'package:provider_app/core/constants/constatnts.dart';
import 'package:provider_app/model/UserModel.dart';

class Service {
  Future<dynamic> getUser() async {
    try {
      Response response = await Dio().get(Constants.Api);
      if (response.statusCode == 200) {
        // print(response.data);
        return NetworkSuccesResponse(
            (response.data as List).map((e) => UserModel.fromJson(e)).toList());
      } else {
        return NetworkErrorResponse(response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return NetworkExeptionResponse(e);
    }
  }
}
