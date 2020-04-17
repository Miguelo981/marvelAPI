class Comic {
  String resourceURI;
  String name;

  ///Constructor del objeto Comic
  Comic({this.resourceURI, this.name});

  ///Funcion para parsear el json recibido de la API a los distintos atributos de la clase
  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}