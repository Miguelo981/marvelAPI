# Marvel API

Aplicacion Flutter para el visualizado de los heroes y villanos de Marvel

## Pantalla de inicio 

En esta pantalla veremos a los Vengadores mientras se cargan todos los archivos principales de la aplicación.

De la gestión de esta pantalla el archivo _splash_page.dart_

![github](https://github.com/Miguelo981/marvelAPI/blob/master/assets/images/Captura1.PNG)

## Lista de personajes 🚀

En esta pantalla contaremos con la lista de los héroes y villanos cargados directamente desde la API de Marvel mostrando una pequeña ilustración si la posee, su nombre y descripción (si la posee).

Lista de personajes gestionada por el archivo _marvel_list_page.dart_

![github](https://github.com/Miguelo981/marvelAPI/blob/master/assets/images/Captura2.PNG)

## Error en la petición 

Cuando sucede algún error en la petición a la API y no devuelve un _status 200_ o el json es parseado de forma errónea, se mostrará un butón para poder refrescar la página y volver a mandar la petición http.

Función gestionada por el archivo _marvel_list_page.dart_

![github](https://github.com/Miguelo981/marvelAPI/blob/master/assets/images/Captura5.PNG)

## Detalle del personaje

Al clicar en cualquiera de los resultados de la lista, pasaremos al detalle del personaje, mostrando una ilustración de mayor tamaño, su descripción ampliada, y los comics en los que hace su aparición dicho personaje.

Esta pantalla se situa en el archivo _marvelCharacter_details_page.dart_

![github](https://github.com/Miguelo981/marvelAPI/blob/master/assets/images/Captura3.PNG)

## Cargar más resultados

Para cargar más resultados (por defecto son 10) contamos con un pequeño botón en la parte inferior derecha, que nos mostrará un pop-up donde nos pedirá la cantidad de resultados que deseamos cargar. Una vez introducido y pulsado search, se refrescara la vista y se realizará una nueva petición a la API.

![github](https://github.com/Miguelo981/marvelAPI/blob/master/assets/images/Captura4.PNG)


## Recursos e investigación 📋

* Estructura del proyecto: https://gitlab.com/felix.galindo/stucom_jjtt_flutter
* Autorización y doc de la API de Marvel: https://developer.marvel.com/documentation/authorization
* Peticiones http: https://flutter.dev/docs/cookbook/networking/fetch-data
             https://medium.com/swlh/how-to-make-http-requests-in-flutter-d12e98ee1cef
* Parseo JSON: https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
