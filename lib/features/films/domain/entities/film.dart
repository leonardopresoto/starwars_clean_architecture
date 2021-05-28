class Film {

  String? title;
  String? episodeId;
  String? openingCrawl;
  String? director;
  String? producer;
  String? releaseDate;
  List<String>? characters;
  List<String>? planets;
  List<String>? starships;
  List<String>? vehicles;
  List<String>? species;
  String? image;
  String? id;
  String? url;

  Film({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.image,
    this.id,
    this.url,
  });

  @override
  String toString() {
    return 'Film{title: $title, episodeId: $episodeId, openingCrawl: $openingCrawl, director: $director, producer: $producer, releaseDate: $releaseDate, characters: $characters, planets: $planets, starships: $starships, vehicles: $vehicles, species: $species, image: $image, id: $id, url: $url}';
  }
}
