import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';
import 'package:starwars_clean_architecture/features/people/domain/entities/person.dart';
import 'package:starwars_clean_architecture/features/people/presentation/pages/person_detail.dart';
import 'package:starwars_clean_architecture/features/people/presentation/widgets/peoplelist_card.dart';

class LoadedList extends StatelessWidget {
  const LoadedList({
    Key key,
    @required this.personList,
  }) : super(key: key);

  final List<Person> personList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils().screenSafeAreaHeight(context) - 24,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(personList.length, (index) {
          return PeopleListCard(
            personList[index].image,
            personList[index].name,
            Utils().randomColor(),
            Utils().randomColor(),
            onClick: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetail(person: personList[index]),
                ),
              )
            },
          );
        }),
      ),
    );
  }
}
