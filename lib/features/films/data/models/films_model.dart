import 'package:meta/meta.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';

class FilmModel extends Film {
  FilmModel(
      {required String? title,
      required String episodeId,
      required String? openingCrawl,
      required String? director,
      required String? producer,
      required String? releaseDate,
      required List<String> characters,
        required List<String> planets,
      required List<String> species,
      required List<String> vehicles,
      required List<String> starships,
      required String? url,
      required String id,
      required String image})
      : super(
            title: title,
            episodeId: episodeId,
            openingCrawl: openingCrawl,
            director: director,
            producer: producer,
            releaseDate: releaseDate,
            characters: characters,
            planets: planets,
            species: species,
            vehicles: vehicles,
            starships: starships,
            url: url,
            id: id,
            image: image);

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        title: json["title"],
        episodeId: json["episode_id"].toString(),
        openingCrawl: json["opening_crawl"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: json["release_date"],
        characters: json["characters"] != null
            ? List<String>.from(json["characters"].map((x) => x))
            : [],
        planets: json["planets"] != null
            ? List<String>.from(json["planets"].map((x) => x))
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
            "assets/films/${json['url'].toString().split("/")[json['url'].toString().split("/").length - 2]}.png",
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmModel && runtimeType == other.runtimeType;
}
