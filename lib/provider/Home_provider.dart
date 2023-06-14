import 'package:flutter/material.dart';
import 'package:provider_app/db/UserDBService.dart';
import 'package:provider_app/model/UserModel.dart';
import 'package:provider_app/service/UserService.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getUser();
  }
  Service userService = Service();

  DBService dbService = DBService();

  bool isLoading = false;
  List<UserModel> data = [];
  String error = '';

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();
    // dynamic response = await userService.getUser();
    dynamic db1 = await dbService.checkUser();
    dynamic db2 = await dbService.getUser();
    if (db1 is List<UserModel>) {
      isLoading = false;
      data = db1;
      notifyListeners();
    } else {
      isLoading = false;
      error = db2;
      print("hello");
      notifyListeners();
    }
  }
}
