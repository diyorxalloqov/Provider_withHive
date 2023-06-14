import 'package:hive/hive.dart';
import 'package:provider_app/model/UserModel.dart';
import 'package:provider_app/service/UserService.dart';

class DBService {
  Box<UserModel>? box;
  Service service = Service();

  Future<dynamic> checkUser() async {
    await openbox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getUser();
    }
  }

  Future<dynamic> getUser() async {
    dynamic response = service.getUser();
    if (response is List<UserModel>) {
      await openbox();
      await writeToDB(response);

      return box!.values.toList();
    } else {
      return response;
    }
  }

  static void registerAdapter() {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }

  Future<void> writeToDB(List<UserModel> model) async {
    await openbox();
    await box!.addAll(model);
    print(box!.keys);
    
  }

  Future<void> openbox() async {
    box = await Hive.openBox<UserModel>("DB");
    
  }
}