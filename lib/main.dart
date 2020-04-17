import 'package:flutter/material.dart';
import 'package:practica1/view/marvel_list_page.dart';
import 'package:practica1/view/splash_page.dart';

void main() => runApp(MyApp());

///Clase main del programar flutter encargado donde setteamos las opciones de tema y fuentes de la aplicacion
///Tambien incluimos las rutas de la aplicacicon
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Collection',
      routes: {
        "/marvelList": (ctx) => MarvelListPage()
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          textTheme: TextTheme(
            title: TextStyle(fontFamily: 'GochiHand', fontSize: 36),
          ),
        ),
        fontFamily: "AmericanCaptain",
      ),
      home: SplashPage(),
    );
  }
}