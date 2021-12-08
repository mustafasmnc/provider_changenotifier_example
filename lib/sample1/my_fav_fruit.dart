import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_changenotifier_example/model/favorites.dart';
import 'package:provider_changenotifier_example/widgets/my_button.dart';

class MyFavFruit extends StatefulWidget {
  const MyFavFruit({Key key}) : super(key: key);

  @override
  _MyFavFruitState createState() => _MyFavFruitState();
}

class _MyFavFruitState extends State<MyFavFruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'My Favorite Fruit is ${Provider.of<Favorites>(context).myFav == null ? '' : Provider.of<Favorites>(context).myFav}'),
        ),
        body: Center(
          child: Column(
            children: [
              MyButton(myFav: 'Banana'),
              MyButton(myFav: 'Apple'),
              MyButton(myFav: 'Strawberry'),
            ],
          ),
        ));
  }
}
