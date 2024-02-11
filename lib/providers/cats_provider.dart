import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:cats_app/models/cat.dart';

//Cats provider es la clase que analiza la url para sacar los datos json de la api

class CatsProvider extends ChangeNotifier {
  //Ponemos la url y la key api para poder conectarnos con la api para enviar nuestra request
  String _baseUrl = 'api.thecatapi.com';
  String _api_key =
      'live_sSmMSfY4t0WbsgWBySqbYcquDmIkE373dpqQ9gBJwtE3aphQSq7UIrgddf4Mempy';

//Lista de cats y de friendlyCats declarada e inicializada como vacia.
  List<Cat> cats = [];
  List<Cat> friendlyCats = [];

  //Metodo que llama al cat Provider
  CatsProvider() {
    print('Cats Provider incialitzat!');
    this.getOnDisplayCats();
  }
  //Usando la url nos conectamos a la api y realizamos la peticion de v1/breeds que devolvera todas las razas de gatos de la api
  getOnDisplayCats() async {
    print('getOnDisplayCats');
    var url = Uri.https(_baseUrl, 'v1/breeds', {'api_key': _api_key});

    //result es la varaible que tomara el json de la API y ponemos await para hacer que espere al procesamiento de datos
    final result = await http.get(url);
    //Si el codigo es 200, la request a sido correctamente aceptada y nos devolvera el json que añadiremos a una lista dinamica
    if (result.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(result.body);
      //Vaciamos las listas de cats para que esten vacia.
      cats.clear();
      friendlyCats.clear();

      //Bucle for para añadir a cada gato de la lista dynamic que hemos pillado antes con result
      for (final catJson in jsonResponse) {
        final cat = Cat.fromJson(catJson);
        cats.add(cat);
        //Si el gato en temperamento tiene 'Friendly' se añadira a la lista de friendly cats también
        if (cat.temperament.contains('Friendly')) {
          friendlyCats.add(cat);
        }
      }

      //El notify hace que la aplicación cargue las listas que se van llenando, si no estuviera esto la lista estaria siempre, por que no hay nada que notifique que se llena.
      notifyListeners();
      //Si el statuscode no es 200, devolvera este texto en forma de mensaje de error.
    } else {
      print('Error en la peticion con el codigo: ${result.statusCode}');
    }
  }
}
