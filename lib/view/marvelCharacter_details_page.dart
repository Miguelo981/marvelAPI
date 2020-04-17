import 'package:flutter/material.dart';
import 'package:practica1/model/MarvelCharacter.dart';
import 'package:provider/provider.dart';

class MarvelDetailsPage extends StatelessWidget {
  final MarvelCharacter hero;
  final int id;

  ///Constructor de la clase MarvelDetailsPage
  MarvelDetailsPage({this.hero, this.id});

  ///Constructor de la pantalla del detalle del personaje
  ///Requiere de un personaje Marvel para poder extraer sus atributos y construir la imagen, nombre, descripcion y comics participantes

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider(
      create: (ctx) => this.hero,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Character"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: screenSize.shortestSide - 10,
              height: screenSize.shortestSide - 10,
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "marvelCharacter-$id",
                    child: Image.network(
                        this.hero.image.getBigImage(), fit: BoxFit.contain),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black87
                          .withAlpha(140),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            this.hero.name,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 35.0,
                              color: Theme
                                  .of(context)
                                  .accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //if (this.hero.descripcion.length > 0) {
            /*Container (
              //if (this.hero.decoration.length > 0) {},
              padding: EdgeInsets.all(8.0),
              color: Color.fromRGBO(51, 97, 255, 100),
              /*constraints: BoxConstraints.expand(
                  width: MediaQuery.of(context).size.width * 0.90, // * 0.90
                  height: MediaQuery.of(context).size.height * 0.31
              ),*/
              child: Row (
                children: <Widget>[
                  Expanded(
                    child: Text(
                    this.hero.description,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    ),
              ),
                ]
              ),
            ),*/
            Expanded(
              child: Consumer<MarvelCharacter>(
                builder: (ctx, hero, child) {
                  if (hero.comics != null) {
                    return ListView.builder(
                      itemCount: hero.comics.length,//_getLength(hero),
                      itemBuilder: (ctx, index) =>
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 0.0,
                                  horizontal: 12.0),
                              padding: EdgeInsets.symmetric(vertical: 8.0,
                                  horizontal: 12.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Theme
                                      .of(context)
                                      .accentColor),
                                ),
                              ),
                              child: _getListViewContent(hero, index)
                          ),
                    );
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Funcion para obtener los contenidos del ListView del detalle del personaje
  /// Se tiene en cuenta si existe descripcion del personaje para evitar null pointers

  Widget _getListViewContent(MarvelCharacter hero, int index) {
    if (hero.description.length > 0 && index == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(hero.description,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ),
        ],
      );
    } else if ((hero.description.length > 0 && index == 1) || (hero.description.length <= 0 && index == 0)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Comics:"),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(hero.comics.elementAt(index).name),
        ],
      );
    }
  }
}

