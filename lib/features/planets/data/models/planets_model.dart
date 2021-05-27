import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/core/config/app_config.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';

class PlanetModel extends Planet {
  PlanetModel(
      {@required String name,
      @required String rotationPeriod,
      @required String orbitalPeriod,
      @required String diameter,
      @required String climate,
      @required String gravity,
      @required String terrain,
      @required String surfaceWater,
      @required String population,
      @required List<String> films,
      @required List<String> residents,
      @required String url,
      @required String id,
      @required String image})
      : super(
            name: name,
            rotationPeriod: rotationPeriod,
            orbitalPeriod: orbitalPeriod,
            diameter: diameter,
            climate: climate,
            gravity: gravity,
            terrain: terrain,
            surfaceWater: surfaceWater,
            population: population,
            films: films,
            residents: residents,
            url: url,
            id: id,
            image: image);

  factory PlanetModel.fromJson(Map<String, dynamic> json) => PlanetModel(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        films: json["films"] != null
            ? List<String>.from(json["films"].map((x) => x))
            : [],
        residents: json["residents"] != null
            ? List<String>.from(json["residents"].map((x) => x))
            : [],
        url: json["url"],
        id: json['url']
            .toString()
            .split("/")[json['url'].toString().split("/").length - 2],
        image:
            "${AppConfig.urlLocalPhotos}/planets/${((int.parse(json['url'].toString().split("/")[json['url'].toString().split("/").length - 2])) % 16 == 0) ? 16.toString() : ((int.parse(json['url'].toString().split("/")[json['url'].toString().split("/").length - 2])) % 16).toString()}.png",
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
      other is PlanetModel && runtimeType == other.runtimeType;
}
