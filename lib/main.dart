import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/db/UserDBService.dart';
import 'package:provider_app/provider/Home_provider.dart';
import 'package:provider_app/ui/HomePage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  DBService.registerAdapter();
  runApp(const Myapp()
      // MultiProvider(providers: [
      //   ChangeNotifierProvider(
      //     create: (context) => HomeProvider(),
      //     child: const Myapp(),
      //   )
      // ])

      ////////    fix this
      );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    /// true code for provider
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
