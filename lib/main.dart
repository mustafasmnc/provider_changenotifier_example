import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_changenotifier_example/model/favorites.dart';
import 'package:provider_changenotifier_example/sample1/my_fav_fruit.dart';
import 'package:provider_changenotifier_example/sample2/my_fav_things.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Favorites(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider ChangeNotifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/sample2",
      routes: {
        "/sample1": (context) => MyFavFruit(),
        "/sample2": (context) => MyFavThings(),
      },
    );
  }
}
