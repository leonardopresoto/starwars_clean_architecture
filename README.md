<h1 align="center">Star Wars - Clean Architecture </h1>

I'm  developing this App aiming to learn about [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) and Dart/Flutter

It's a very simple app which the user can only access and see some information. As I was learning about clean architecture, I focused more on the code structure than the app's features/functionality.

<h2>My code references were: </h2>

* ResoCoder (Main reference):
  * [TDD Clean Architecture for Flutter - GitHub](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)
  * [Clean Architecture Playlist (EN) - Youtube (EN)](https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech)
  
* Flutterando:
  * [Clean Dart - GitHub](https://github.com/Flutterando/Clean-Dart)
  * [Clean Architecture Playlist - Youtube (PT-BR)](https://www.youtube.com/watch?v=VacEeKvY2bg&list=PLlBnICoI-g-d-v_fWlkZX2HRgHHPnJx9s)

* [BloC Library](https://bloclibrary.dev/#/)

<h2>Layout: </h2>

To develop the layout I based on some layouts I found browsing the internet:
- Dashboard - [List Design](https://br.pinterest.com/pin/546342998551395572/)
- Characters (*I didn't remember of any specific reference*)
- Films - [Slider Layout](https://pub.dev/packages/carousel_slider)
- Planets - [Page Layout](https://sergiandreplace.com/planets-flutter-creating-a-list-of-planets/) *- this one I just change some features, the code is quite the same*
- Species, Starships, Vehicles - [Expandable](https://pub.dev/packages/expandable)

I'm not proud of this layout, mainly because it was not the goal of this project. However, I am open to suggestions. If someone wants to suggest a better layout, I may update the project.

<h2>Data: </h2>

I'm consuming the APIs from [SWAPI](https://swapi.dev/).

<h2>Project Development: </h2>

* Flutter version: 2.2.0
* Dart version: >=2.12.0 <3.0.0 (Null Safety)
* Functional Programing - [dartz](https://pub.dev/packages/dartz) version: 0.10.0-nullsafety.2
* Remote API:
  * Check Internet Connection - [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) version: 0.0.1+1
  * Library for making HTTP requests - [http](https://pub.dev/packages/http) version: 0.13.3
* Local Persistence:
  * SQL Database engine - [sqflite](https://pub.dev/packages/sqflite) version: 2.0.0+3
  * String-based path manipulation library - [path](https://pub.dev/packages/path) version: 1.8.0
* State Management - [flutter_bloC](https://pub.dev/packages/flutter_bloc) version: 7.0.0
* Value Equality - [equatable](https://pub.dev/packages/equatable) version: 2.0.2
* Service Locator - [get_it](https://pub.dev/packages/get_it) version: 7.1.3
* Shared Preferences - [shared_preferences](https://pub.dev/packages/shared_preferences) version: 2.0.6
* Carousel Slider (Layout)- [carousel_slider](https://pub.dev/packages/carousel_slider) version: 4.0.0-nullsafety.0
* Widget that expand and collapse (Layout) - [expandable](https://pub.dev/packages/expandable) version: 5.0.1

<h2>Screenshots </h2>

<p align="center">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/dashboard.jpg" width="200" title="Dashboard screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/movies.jpg" width="200" alt="Films screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/characters.jpg" width="200" alt="Character screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/characters-details.jpg" width="200" alt="Character details screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/starships.jpg" width="200" alt="Starships screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/starships-details.jpg" width="200" alt="Character details screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/vehicles.jpg" width="200" alt="Vehicles screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/species.jpg" width="200" alt="Species screen">
  <img src="https://github.com/leonardopresoto/starwars_clean_architecture/blob/main/screenshots/planets.jpg" width="200" alt="Planets screen">
</p>

<h2>To Do: </h2>

### Some Improvements I'm planning to do
- [ ] Create Tests to Films, Planets, Starships, Species, Vehicles and Core components*
- [ ] Finish Planets screen
- [X] Switch Theme structure (Shared Preferences)
- [ ] Switch between Light/Dark Theme - (Probably I will include it on Drawer, AppBar or Both, I already started it)
- [ ] Develop the local data structure (local database)
- [ ] Get the online data only once (after that use local data (local database)
- [ ] Identify any SharePreferences change using Get_it
- [ ] Identify any DataBase change using Get_it
- [ ] Layout Improvements on Lists (Like list of movies on Character Detail Page. Replace id by tile)
- [ ] Optimize the similar code between different features
- [ ] Check if the Clean Architecture concepts are still being properly used
- [ ] \(Optional) Layout Update (more professional layout)

(*)I know it wrong do tests after, but I was learning about Clean Arch not TDD. After develop People 
feature, i did the other by using CTRL+C/CTRLV (... And I was too lazy to do the tests). 


Any suggestion, please let me know!