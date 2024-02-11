import 'package:flutter/material.dart';
import 'package:cats_app/providers/cats_provider.dart';
import 'package:cats_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

/**Clase que maneja la pantalla principal del programa, recibira la información del provider y lo cargara en sus dos widgets principales
 que en este caso son card_swiper y FriendlyCats_slider.
*/
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catsProvider = Provider.of<CatsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CardSwiper(cats: catsProvider.cats),
              FriendlyCats(cats: catsProvider.friendlyCats),
            ],
          ),
        ),
      ),
    );
  }
}
