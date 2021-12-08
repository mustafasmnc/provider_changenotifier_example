import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_changenotifier_example/model/favorites.dart';

class MyButton extends StatelessWidget {
  final String myFavThing;
  final String myFav;
  const MyButton({Key key, this.myFav, this.myFavThing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Provider.of<Favorites>(context, listen: false).changeMyFav(
              myFav); //Provider ile changeMyFav fonk cagrilarak myFav değişkeni guncelleniyor
          Provider.of<Favorites>(context, listen: false)
              .addFavs(myFavThing, myFav);
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView.builder(
                    itemCount: Provider.of<Favorites>(context).favs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Provider.of<Favorites>(context)
                                    .favs[index]
                                    .myFavThing ==
                                'Fruit'
                            ? Icons.local_grocery_store
                            : Provider.of<Favorites>(context)
                                        .favs[index]
                                        .myFavThing ==
                                    'Music'
                                ? Icons.music_note
                                : Icons.movie_creation),
                        title: Text(
                            '${Provider.of<Favorites>(context).favs[index].myFav}'),
                      );
                    });
              });
        },
        child: Text(myFav));
  }
}
