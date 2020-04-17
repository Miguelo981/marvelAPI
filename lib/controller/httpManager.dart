import 'dart:convert';
import 'package:practica1/model/MarvelCharacter.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

String url = "gateway.marvel.com";
String publicKey = "c1f287ddbcc839e39cd1507e6971d9e3";
String privateKey = "80828a54054b14878765fd763643498f2f1a343a";
String ts = "5";

///Funcion para generar el Hash de tipo MD5 para la peticion de la API
String generateMd5(String ts, String key1, String key2) {
  return md5.convert(utf8.encode(ts + key2 + key1)).toString();
}

void printHash() {
  print(generateMd5(ts, publicKey, privateKey));
}

///Funcion para la gestion de los query params
getQueryParamsLimit(limit) {
  return  {
    'apikey': publicKey,
    'ts': ts,
    'hash': generateMd5(ts, publicKey, privateKey),
    'limit': limit.toString(),
  };
}

///Funcion para extraer los personajes de Marvel mediante una peticion a la API
///Una vez recibido un json al recibir un status 200, lo decodificamos y retornamos una lista deMarvelCharacter pasando el json
Future<List<MarvelCharacter>> getHeroesMax(int amount) async {
  var response = await http.get(Uri.http(url, '/v1/public/characters', getQueryParamsLimit(amount)));
  if (response.statusCode == 200) {
    final Iterable jsone = json.decode(response.body)['data']['results'];
    var heroes = jsone.map((hero) => MarvelCharacter.fromJson(hero)).toList();
    return heroes;
  } else {
    throw Exception('Failed to load hero');
  }
}