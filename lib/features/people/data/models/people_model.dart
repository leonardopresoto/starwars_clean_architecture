import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';

class PersonModel extends Person {
  PersonModel(
      {required String? name,
      required String? height,
      required String? mass,
      required String? hairColor,
      required String? skinColor,
      required String? eyeColor,
      required String? birthYear,
      required String? gender,
      required String? homeworld,
      required List<String> films,
      required List<String> species,
      required List<String> vehicles,
      required List<String> starships,
      required String? url,
      required String? id,
      required String? image})
      : super(
            name: name,
            height: height,
            mass: mass,
            hairColor: hairColor,
            skinColor: skinColor,
            eyeColor: eyeColor,
            birthYear: birthYear,
            gender: gender,
            homeworld: homeworld,
            films: films,
            species: species,
            vehicles: vehicles,
            starships: starships,
            url: url,
            id: id,
            image: image);

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        homeworld: json["homeworld"]
            .toString()
            .split("/")[json['homeworld'].toString().split("/").length - 2],
        films: json["films"] != null
            ? List<String>.from(json["films"].map((x) => x))
            : [],
        species: json["species"] != null
            ? List<String>.from(json["species"].map((x) => x))
            : [],
        vehicles: json["vehicles"] != null
            ? List<String>.from(json["vehicles"].map((x) => x))
            : [],
        starships: json["starships"] != null
            ? List<String>.from(json["starships"].map((x) => x))
            : [],
        url: json["url"],
        id: json['url']
            .toString()
            .split("/")[json['url'].toString().split("/").length - 2],
        image:
            "assets/characters/${json['url'].toString().split("/")[json['url'].toString().split("/").length - 2]}.png",
      );

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'height': height,
  //     'mass': mass,
  //     'hairColor': hairColor,
  //     'skinColor': skinColor,
  //     'eyeColor': eyeColor,
  //     'birthYear': birthYear,
  //     'homeworld': homeworld,
  //     'films': films.toString(),
  //     'species': species.toString(),
  //     'vehicles': vehicles.toString(),
  //     'starships': starships.toString(),
  //     'url': url,
  //     'id': id,
  //     'image': image
  //   };
  // }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonModel && runtimeType == other.runtimeType;
}
