import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/films/domain/entities/film.dart';

import 'film_content.dart';
import 'filmlist_card.dart';

class LoadedList extends StatefulWidget {
  const LoadedList({
    Key? key,
    required this.filmList,
  }) : super(key: key);

  final List<Film> filmList;
  @override
  _LoadedListState createState() => _LoadedListState();
}

class _LoadedListState extends State<LoadedList> {

  int _currentIndex = 0;
  List<dynamic> information = ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"];
  List<Film> listOfFilms = [];
  List<FilmCarouselItem> cardList = [];

  @override
  initState() {
    super.initState();
      setState(() {
        listOfFilms = widget.filmList;
        cardList = ListGenerate().listGenerate(listOfFilms);
        information = [
          listOfFilms[0].title,
          listOfFilms[0].releaseDate,
          listOfFilms[0].director,
          listOfFilms[0].producer,
          listOfFilms[0].openingCrawl,
          listOfFilms[0].characters,
          listOfFilms[0].planets,
          listOfFilms[0].starships,
          listOfFilms[0].vehicles,
          listOfFilms[0].species
        ];
      });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils().screenSafeAreaHeight(context) - 24,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              _buildCarouselSlider(listOfFilms),
             _buildCarouselLegend(),
              FilmContent(data: information)
            ],
          ),
        ),
      ),
    );
  }

  CarouselSlider _buildCarouselSlider(List<Film> filmsList) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: false,
        viewportFraction: 0.45,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
            information = [
              filmsList[index].title,
              filmsList[index].releaseDate,
              filmsList[index].director,
              filmsList[index].producer,
              filmsList[index].openingCrawl,
              filmsList[index].characters,
              filmsList[index].planets,
              filmsList[index].starships,
              filmsList[index].vehicles,
              filmsList[index].species
            ];
          });
        },
      ),
      items: cardList.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              child: card,
            ),
          );
        });
      }).toList(),
    );
  }

  Row _buildCarouselLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: map<Widget>(cardList, (index, url) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? YELLOW_STARWARS : (Utils().isLightTheme())? Colors.grey:Colors.white,
          ),
        );
      }),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}

class ListGenerate {
  List<FilmCarouselItem> list = [];

  ListGenerate();

  List<FilmCarouselItem> listGenerate(List<Film> result) {
    for (int index = 0; index < result.length; index++) {
      list.add(FilmCarouselItem(result[index].title, result[index].image));
    }
    return list;
  }
}