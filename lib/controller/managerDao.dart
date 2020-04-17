import 'package:practica1/model/MarvelCharacter.dart';
import 'httpManager.dart' as httpmanager;

///Clase singleton ManagerDao como controlador principal del programa
class managerDao {
  static final managerDao manager = managerDao._internal();
  List<MarvelCharacter> heroes;

  ///Funcion tipo factory que retorna la instancia estatica del manager
  factory managerDao() {
    return manager;
  }

  managerDao._internal();

  ///Funcion para comunicarse con la clase httpManager y extraer los personajes de la API
  Future<List<MarvelCharacter>> getHeroesMax(int amount) {
    return httpmanager.getHeroesMax(amount);
  }

}