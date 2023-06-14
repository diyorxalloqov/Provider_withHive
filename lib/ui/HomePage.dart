import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/Home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Provider"),
          ),
          body: Builder(builder: (context) {
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (provider.error.isNotEmpty) {
              return Center(
                child: Text(provider.error),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(provider.data[index].name.toString()),
                  );
                },
                itemCount: provider.data.length,
              );
            }
          }),
        );
      },
    );
  }
}
