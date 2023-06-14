import 'package:dio/dio.dart';
import 'package:provider_app/core/constants/constatnts.dart';
import 'package:provider_app/model/UserModel.dart';

class Service {
  Future<dynamic> getUser() async {
    try {
      Response response = await Dio().get(Constants.Api);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
