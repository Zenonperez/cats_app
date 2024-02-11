import 'package:flutter/material.dart';
import 'package:cats_app/models/cat.dart';

/*Esta clase es la que se mostrara cuando se haga click en una imagen mostrando la informacion detallada de
la raza del gato */

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Por cada instancia de gato tendremos una pantalla de detalles
    final Cat cat = ModalRoute.of(context)?.settings.arguments as Cat;
    //Esta sera la estructura que tendra los detalles del gato
    return Scaffold(
      //Añadimos un scroll para mover si el tamaño de los datos es mayor que la pantalla
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(cat: cat),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _BaseInfo(cat: cat),
                _Temperament(cat: cat),
                _Overview(cat: cat),
                _Characteristics(cat: cat)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Este widget es la parte superior de los detalles, donde estara la imagen del gato
class _CustomAppBar extends StatelessWidget {
  final Cat cat;

  const _CustomAppBar({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            cat.name,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(cat.Urlimage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//Widget que pondra la informacion base de la raza del gato
class _BaseInfo extends StatelessWidget {
  final Cat cat;

  const _BaseInfo({Key? key, required this.cat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Origin: ' + cat.origin,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lifespan: ' + cat.lifeSpan + ' years',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Weight: ' + cat.weight + 'kg',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

//Widget que consistira en poner el temperamento que tiene la raza del gato
class _Temperament extends StatelessWidget {
  final Cat cat;

  const _Temperament({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text('Temperament: ' + cat.temperament,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}

//Widget que pone una descripcion detallada de la informacion de la raza del gato
class _Overview extends StatelessWidget {
  final Cat cat;

  const _Overview({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        cat.description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

//Widget en la que se expondra a modo de texto algunas caracteristicas de la raza del gato en dos columnas
class _Characteristics extends StatelessWidget {
  final Cat cat;

  const _Characteristics({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Column(
              children: [
                Text('Characteristics:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Adaptability: ' + cat.adaptabilityString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Affection Level: ' + cat.affectionLevelString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Inteligence: ' + cat.intelligenceString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Energy Level: ' + cat.energyLevelString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Social needs: ' + cat.socialNeedsString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Shedding Level: ' + cat.sheddingLevelString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Affection Level: ' + cat.affectionLevelString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Grooming: ' + cat.groomingString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Vocalisation: ' + cat.vocalisationString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Stranger friendly ' + cat.strangerFriendlyString,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ));
  }
}
