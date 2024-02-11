/*Clase que nace de la clase breeds, es una version simplificada de breeds y 
nos ayudara a dividir a cada raza de gato como un objeto que lo podremos guardar dentro de la lista
*/

//Varaibles del objeto cat
class Cat {
  String name;
  String description;
  String temperament;
  String origin;
  String lifeSpan;
  String weight;
  String? image;
  int adaptability;
  int affectionLevel;
  int intelligence;
  int energyLevel;
  int socialNeeds;
  int sheddingLevel;
  int grooming;
  int vocalisation;
  int strangerFriendly;
//Constructor de cat
  Cat({
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    required this.weight,
    required this.image,
    required this.adaptability,
    required this.affectionLevel,
    required this.intelligence,
    required this.energyLevel,
    required this.socialNeeds,
    required this.sheddingLevel,
    required this.grooming,
    required this.vocalisation,
    required this.strangerFriendly,
  });
//Getters de todos los ints para pasarlos a toString y devolver un String
  get strangerFriendlyString {
    return strangerFriendly.toString();
  }

  get vocalisationString {
    return vocalisation.toString();
  }

  get groomingString {
    return grooming.toString();
  }

  get sheddingLevelString {
    return sheddingLevel.toString();
  }

  get socialNeedsString {
    return socialNeeds.toString();
  }

  get energyLevelString {
    return energyLevel.toString();
  }

  get intelligenceString {
    return intelligence.toString();
  }

  get affectionLevelString {
    return affectionLevel.toString();
  }

  get adaptabilityString {
    return adaptability.toString();
  }

//Metodo en caso de que de null pues devuelva esta imagen ya que hay gatos que no tienen imagen
  get Urlimage {
    if (this.image != null) {
      return image;
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

//Metodo que mapea el json como un objeto de gato.
  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
        name: json['name'] ?? 'Nombre no disponible',
        description: json['description'] ?? 'Descripcion no disponible',
        temperament: json['temperament'] ?? 'Temperamento no disponible',
        origin: json['origin'] ?? 'Origen no disponible',
        lifeSpan: json['life_span'] ?? 'LifeSpan no disponible',
        weight: json['weight']?['imperial'] ?? 'Peso no disponible',
        image: json['image']?['url'] ?? 'https://i.stack.imgur.com/GNhxO.png',
        adaptability: json['adaptability'] ?? 0,
        affectionLevel: json['affection_level'] ?? 0,
        intelligence: json['intelligence'] ?? 0,
        energyLevel: json['energy_level'] ?? 0,
        socialNeeds: json['social_needs'] ?? 0,
        sheddingLevel: json['shedding_level'] ?? 0,
        grooming: json['grooming'] ?? 0,
        vocalisation: json['vocalisation'] ?? 0,
        strangerFriendly: json['stranger_friendly'] ?? 0);
  }
}
