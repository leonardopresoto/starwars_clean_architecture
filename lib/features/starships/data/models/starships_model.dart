import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/starships/domain/entities/starship.dart';

class StarshipModel extends Starship {
  StarshipModel(
      {required String? name,
      required String? model,
      required String? manufacturer,
      required String? costInCredits,
      required String? length,
      required String? maxAtmospheringSpeed,
      required String? crew,
      required String? passengers,
      required String? cargoCapacity,
      required String? consumables,
      required String? hyperdriveRating,
      required String? mglt,
      required String? starshipClass,
      required List<String> films,
      required List<String> pilots,
      required String? url,
      required String id,
      required String image})
      : super(
            name: name,
            model: model,
            manufacturer: manufacturer,
            costInCredits: costInCredits,
            length: length,
            maxAtmospheringSpeed: maxAtmospheringSpeed,
            crew: crew,
            passengers: passengers,
            cargoCapacity: cargoCapacity,
            consumables: consumables,
            hyperdriveRating: hyperdriveRating,
            mglt: mglt,
            starshipClass: starshipClass,
            films: films,
            pilots: pilots,
            url: url,
            id: id,
            image: image);

  factory StarshipModel.fromJson(Map<String, dynamic> json) => StarshipModel(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        hyperdriveRating: json["hyperdrive_rating"],
        mglt: json["MGLT"],
        starshipClass: json["starship_class"],
        films: json["films"] != null
            ? List<String>.from(json["films"].map((x) => x))
            : [],
        pilots: json["pilots"] != null
            ? List<String>.from(json["pilots"].map((x) => x))
            : [],
        url: json["url"],
        id: json['url']
            .toString()
            .split("/")[json['url'].toString().split("/").length - 2],
        image:
            "assets/starships/${json['url'].toString().split("/")[json['url'].toString().split("/").length - 2]}.png",
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
      other is StarshipModel && runtimeType == other.runtimeType;
}
