import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/species/domain/entities/specie.dart';

class SpecieModel extends Specie {
  SpecieModel(
      {@required String name,
      @required String classification,
      @required String designation,
      @required String averageHeight,
      @required String skinColors,
      @required String eyeColors,
      @required String hairColors,
      @required String averageLifespan,
      @required String homeworld,
      @required String language,
      @required List<String> films,
      @required List<String> people,
      @required String url,
      @required String id,
      @required String image})
      : super(
            name: name,
            classification: classification,
            designation: designation,
            averageHeight: averageHeight,
            skinColors: skinColors,
            eyeColors: eyeColors,
            hairColors: hairColors,
            averageLifespan: averageLifespan,
            homeworld: homeworld,
            language: language,
            films: films,
            people: people,
            url: url,
            id: id,
            image: image);

  factory SpecieModel.fromJson(Map<String, dynamic> json) => SpecieModel(
        name: json["name"],
        classification: json["classification"],
        designation: json["designation"],
        averageHeight: json["average_height"],
        skinColors: json["skin_colors"],
        eyeColors: json["eye_colors"],
        hairColors: json["hair_colors"],
        averageLifespan: json["average_lifespan"],
        homeworld: json["homeworld"]
            .toString()
            .split("/")[json['homeworld'].toString().split("/").length - 2],
        language: json["language"],
        films: json["films"] != null
            ? List<String>.from(json["films"].map((x) => x))
            : [],
        people: json["people"] != null
            ? List<String>.from(json["people"].map((x) => x))
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
      other is SpecieModel && runtimeType == other.runtimeType;
}
