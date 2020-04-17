class Thumbnail {
  String src;
  String extension;

  ///Constructor de la clase Thumbnail
  Thumbnail({this.src, this.extension});

  ///Funcion para parsear el json recibido de la API a los distintos atributos de la clase
  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      src: json['path'],
      extension: json['extension'],
    );
  }

  ///Getter para extraer la ruta del formato mediano de la imagen
  String getSmallImage() {
    return src+"/portrait_medium."+extension;
  }

  ///Getter para extraer la ruta del formato grande de la imagen
  String getBigImage() {
    return src+"/portrait_uncanny."+extension;
  }

}