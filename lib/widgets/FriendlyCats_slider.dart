import 'package:flutter/material.dart';
import 'package:cats_app/models/cat.dart';


//Clase que manejara los sliders de los gatos más amigables, que estos vienen de una lista que ofrece el provider,
//el funcionamiento es similar al de cardSwiper
class FriendlyCats extends StatelessWidget {
  
  final List<Cat> cats;
  const FriendlyCats({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Most Friendly Cats Breeds',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            //Aqui se manejara cada objeto de la lista de gato en un gato que tendra su propio slider y al puslarlo podemso ver su informacion
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: cats.map((cat) => _CatPoster
              (cat:cat)).toList(),
          ),
          ),
        ],
      ),
    );
  }
}

//Aqui es la clase que maneja el widget de cada contendor que tiene el slider donde cargara una imagen de gato y lo asociara aun objeto de este
class _CatPoster extends StatelessWidget {
  final Cat cat;
  const _CatPoster
({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: cat),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(cat.Urlimage),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            cat.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
