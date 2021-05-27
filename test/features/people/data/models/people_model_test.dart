import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_clean_architecture/features/people/data/models/people_model.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final listOfPeopleModel = <PersonModel>[];
  final luke = PersonModel(
      name: "Luke Skywalker",
      height: "172",
      mass: "77",
      hairColor: "blond",
      skinColor: "fair",
      eyeColor: "blue",
      birthYear: "19BBY",
      gender: "male",
      homeworld: "http://swapi.dev/api/planets/1/",
      films: [
        "http://swapi.dev/api/films/1/",
        "http://swapi.dev/api/films/2/",
        "http://swapi.dev/api/films/3/",
        "http://swapi.dev/api/films/6/"
      ],
      species: [],
      vehicles: [
        "http://swapi.dev/api/vehicles/14/",
        "http://swapi.dev/api/vehicles/30/"
      ],
      starships: [
        "http://swapi.dev/api/starships/12/",
        "http://swapi.dev/api/starships/22/"
      ],
      url: "http://swapi.dev/api/people/1/",
      id: '1',
      image: 'assets/characters/1.png');
  final lukeToString =
      "Person{name: Luke Skywalker, height: 172, mass: 77, hairColor: blond, skinColor: fair, eyeColor: blue, birthYear: 19BBY, gender: null, homeworld: http://swapi.dev/api/planets/1/, films: [http://swapi.dev/api/films/1/, http://swapi.dev/api/films/2/, http://swapi.dev/api/films/3/, http://swapi.dev/api/films/6/], species: [], vehicles: [http://swapi.dev/api/vehicles/14/, http://swapi.dev/api/vehicles/30/], starships: [http://swapi.dev/api/starships/12/, http://swapi.dev/api/starships/22/], url: http://swapi.dev/api/people/1/, id: 1, image: assets/characters/1.png}";

  test(
    "it should subclass of People (.. -> domain -> entities)",
    () {
      expect(luke, isA<Person>());
      expect(listOfPeopleModel, isA<List<Person>>());
    },
  );

  group("fromJson tests", () {
    test(
      'should return a valid PersonModel object',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('luke.json'));
        final result = PersonModel.fromJson(jsonMap);
        expect(result, luke);
        expect(result.toString(), luke.toString());
      },
    );

    test(
      'should return a valid List<Person> objetc',
      () async {
        List<Person> result = [];
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('people.json'));
        for (var person in jsonMap['results']) {
          result.add(PersonModel.fromJson(person));
        }
        expect(result, isA<List<Person>>());
        expect(result.length, 10);
        expect(result[0].name, "Luke Skywalker");
        expect(result[9].name, "Obi-Wan Kenobi");
        expect(result[0].toString(), lukeToString);
      },
    );
  });
}
