import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:cats_app/models/cat.dart';


/**Clase que se encarga de gestionar el funcionamiento del cardSwiper, esta recibira una lista de gatos desde del
home_screen que esta viene del provider, aqui se encotraran todas las razas de gatos de la API
*/


class CardSwiper extends StatelessWidget {
  
  final List<Cat> cats;

  const CardSwiper({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Para que sea visualmente más estetico mientras estan cargando los gatos, hacemos que haga esto mientras la lista esta vacia
    if(this.cats.length == 0){
      return Container(width: double.infinity,
      height: size.height*0.5,
      child: Center(
        child: CircularProgressIndicator(),
        ),
        );
    }
    return Container(
        width: double.infinity,
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
        child: Swiper(
          itemCount: cats.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          //Por cada gato se creara una card_swipe que al pulsar nos llevara a un objeto gato con su informacion
          itemBuilder: (BuildContext context, int index) {
            final cat = cats[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: cat),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(cat.Urlimage),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
