import 'package:flutter/material.dart';
import 'package:practica1/model/MarvelCharacter.dart';
import 'package:practica1/view/marvelCharacter_details_page.dart';
import 'package:practica1/controller/managerDao.dart';

class MarvelListPage extends StatefulWidget {
  @override
  _MarvelListPageState createState() => _MarvelListPageState();
}

///Clase MarvelListPageState encargada de la creacion del listaView de personajes
///Usa como parametros el manager para cargar los personajes y un controller de textField
class _MarvelListPageState extends State<MarvelListPage> {
  managerDao manager = managerDao();
  TextEditingController amountController = new TextEditingController();
  bool first_time = true;

  ///Constructor de la pantalla que contiene la lista de personajes
  ///Por defecto cargara solo 10 personajes
  @override
  Widget build(BuildContext context) {
    if (first_time) amountController.text = "10";
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel List'),
      ),
      body: Stack(
      children: <Widget>[
        Center(
        child: _getList(int.parse(amountController.text))
      ),
      Container(
        child: ClipOval(
          child: Material(
            color: Colors.blue, // button color
            child: InkWell(
              splashColor: Colors.red, // inkwell color
              child: SizedBox(width: 70, height: 70, child: Icon(Icons.menu)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: new Text("Character loader"),
                      content: Container (
                          child: TextField(
                            controller: amountController,
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Enter the character amount',
                              hintText: '10'),
                        ),
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Search"),
                          onPressed: () {
                            setState(() {
                              first_time = false;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
        alignment: Alignment(0.95, 0.95),
      )
    ],
      )
    );
  }

  ///Funcion para obtener y devolver :
  ///1. En caso de que la peticion se concluya correctamente, la lista de personajes
  ///2. En caso de que haya algun problema en la peticion, un boton para refrescar los resultados
  Widget _getList(int amount) {
    return FutureBuilder<List<MarvelCharacter>>(
        future: manager.getHeroesMax(amount),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return _buildListOfCharacters(snapshot.data);
            } else {
              return _buildRetryButton();
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  ///Funcion para refrescar la pantalla
  Widget _buildRetryButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("ERROR DOWNLOADING DATA"),
          FlatButton.icon(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.refresh),
            label: const Text("Try again!"),
            onPressed: () => setState(() {}),
          ),
        ],
      ),
    );
  }

  ///Funcion para recibir los personajes y devolver el ListView
  Widget _buildListOfCharacters(List<MarvelCharacter> heroes) {
    return ListView.builder(
      itemCount: heroes.length,
      itemBuilder: (ctx, index) {
        MarvelCharacter hero = heroes[index];
        return InkWell(
          child: ListTile(
            leading: Hero(
              tag: "hero-${hero.id}",
              child: Image.network(hero.image.getSmallImage()),
            ),
            title: Text(
              hero.name,
              style: TextStyle(
                fontSize: 48.0,
              ),
            ),
            subtitle: Text(hero.description),
          ),
          onTap: () {
            setState(() {});
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => MarvelDetailsPage(
                    hero: hero,
                    id: hero.id
                ),
              ),
            );
          },
        );
        },
    );
  }
}