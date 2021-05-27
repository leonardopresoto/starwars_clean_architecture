import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';

class PeopleListCard extends StatelessWidget {
  final String image;
  final Function onClick;
  final String name;
  final Color color1;
  final Color color2;

  PeopleListCard(
    this.image,
    this.name,
    this.color1,
    this.color2, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: Utils().buildBorderRadius(),
      ),
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: Utils().buildBorderRadius(),
              gradient: LinearGradient(colors: [color1, color2]),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 15,
                    child: Image.asset(image),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.black38,
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                              textAlign: TextAlign.start),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
