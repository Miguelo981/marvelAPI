import 'package:flutter/cupertino.dart';
import 'Comic.dart';
import 'Thumbnail.dart';

class MarvelCharacter extends ChangeNotifier{
  int id;
  String name;
  String description;
  Thumbnail image;
  List<Comic> comics;

  ///Constructor de la clase MarvelCharacter
  ///Hereda de ChangeNotifier para poder utilizarlo en el objeto ChangeNotifierProvider del detalle
  MarvelCharacter({this.id, this.name, this.description, this.image, this.comics});

  ///Funcion para parsear el json recibido de la API a los distintos atributos de la clase
  factory MarvelCharacter.fromJson(Map<String, dynamic> json) {
    return MarvelCharacter(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: Thumbnail.fromJson(json['thumbnail']),
      comics: (json['comics']['items'] as List).map((comic) => Comic.fromJson(comic)).toList());
  }

  String toString() {
    return this.name + ": " + this.description;
  }
}