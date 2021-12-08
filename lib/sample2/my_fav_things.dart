import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_changenotifier_example/model/favorites.dart';
import 'package:provider_changenotifier_example/widgets/my_button.dart';

class MyFavThings extends StatefulWidget {
  const MyFavThings({Key key}) : super(key: key);

  @override
  _MyFavThingsState createState() => _MyFavThingsState();
}

class _MyFavThingsState extends State<MyFavThings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
                'My Favorite ${Provider.of<Favorites>(context).myFavThing == null ? 'Fruit' : Provider.of<Favorites>(context).myFavThing} is ${Provider.of<Favorites>(context).myFav == null ? '' : Provider.of<Favorites>(context).myFav}'), // Provider ile myFav ve myFavThing değişkenleri guncelleniyor
            toolbarHeight: 70,
            elevation: 0,
            bottom: TabBar(
              onTap: (index) {
                Provider.of<Favorites>(context, listen: false).changeMyFav(
                    ''); //Provider ile changeMyFav fonk cagrilarak myFav değişkeni '' olarak guncelleniyor
                Provider.of<Favorites>(context, listen: false)
                    .changemyFavThing(index == 0
                        ? 'Fruit'
                        : index == 1
                            ? 'Music'
                            : 'Movie');
              },
              tabs: [
                Tab(
                  child: Icon(Icons.local_grocery_store),
                ),
                Tab(
                  child: Icon(Icons.music_note),
                ),
                Tab(
                  child: Icon(Icons.movie_creation),
                )
              ],
            ),
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                child: Icon(
                  Icons.local_grocery_store,
                  color: Colors.blueAccent,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.music_note,
                  color: Colors.blueAccent,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.movie_creation,
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
          body: TabBarView(children: [
            Container(
              color: Colors.orangeAccent,
              child: Center(
                child: Column(
                  children: [
                    MyButton(myFavThing: 'Fruit', myFav: 'Banana'),
                    MyButton(myFavThing: 'Fruit', myFav: 'Apple'),
                    MyButton(myFavThing: 'Fruit', myFav: 'Strawberry'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.amberAccent,
              child: Center(
                child: Column(
                  children: [
                    MyButton(myFavThing: 'Music', myFav: 'Rammstein'),
                    MyButton(myFavThing: 'Music', myFav: 'Neffex'),
                    MyButton(myFavThing: 'Music', myFav: 'Linkin Park'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.tealAccent,
              child: Center(
                child: Column(
                  children: [
                    MyButton(myFavThing: 'Movie', myFav: 'LOTR'),
                    MyButton(myFavThing: 'Movie', myFav: 'Harry Potter'),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
