import 'package:flutter/material.dart';
import 'package:cats_app/providers/cats_provider.dart';
import 'package:cats_app/screens/screens.dart';
import 'package:provider/provider.dart';

//Clase main que es la encargada de la ejecucion del programa
void main() => runApp(AppState());
//Esta clase llamara primero a CatsProvider para cargar la informacion y luego llamara a myApp para iniciar las pantallas.
class AppState extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatsProvider(), 
        lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}
//Clase que maneja las pantallas de home y detalles donde iniciara en home primero
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cats',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailsScreen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
