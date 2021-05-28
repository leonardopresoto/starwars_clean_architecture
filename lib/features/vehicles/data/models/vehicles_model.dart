import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/vehicles/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  VehicleModel(
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
      required String? vehicleClass,
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
            vehicleClass: vehicleClass,
            films: films,
            pilots: pilots,
            url: url,
            id: id,
            image: image);

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
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
        vehicleClass: json["vehicle_class"],
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
            "assets/vehicles/${json['url'].toString().split("/")[json['url'].toString().split("/").length - 2]}.png",
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
      other is VehicleModel && runtimeType == other.runtimeType;
}
