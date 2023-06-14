import 'package:dio/dio.dart';
import 'package:provider_app/model/UserModel.dart';

class Service {
  Future<dynamic> getUser() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        // print(response.data);
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
