import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_clean_architecture/core/theme/theme_manager.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';


class FilmContent extends StatelessWidget {
  const FilmContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeStarWarsAppNotifier>(
      builder: (context, theme, child) => Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _rowCenter("Title : ", 20, data[0], 25),
            _rowCenter("Release : ", 10, data[1], 15),
            _buildDivider(context),
            _rowSimpleData("Director : ", data[2]),
            _rowSimpleData(
                "Producer : ", data[3].replaceAll(", ", "\r\n")),
            _buildDivider(context),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text("Opening Crawl : ", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data[4]}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: _defineTextColor()
                    ),
                  ),
                ],
              ),
            ),
            _buildDivider(context),
            _rowList("Characters :", Utils().prepareLists(data[5])),
            _buildDivider(context),
            _rowList("Planets : ", Utils().prepareLists(data[6])),
            _buildDivider(context),
            _rowList("Starship : ", Utils().prepareLists(data[7])),
            _buildDivider(context),
            _rowList("Vehicles : ", Utils().prepareLists(data[8])),
            _buildDivider(context),
            _rowList("Species : ", Utils().prepareLists(data[9])),
          ],
        ),
      ),
    );
  }

  Row _rowCenter(
      String titleDescription, double titleSize, String data, double dataSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleDescription,
          style: TextStyle(fontSize: titleSize),
        ),
        Text(
          data,
          style: TextStyle(
              fontSize: dataSize,
              fontWeight: FontWeight.bold,
              // color: _defineTextColor()
          ),
        ),
      ],
    );
  }

  Padding _rowSimpleData(String description, String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: _defineTextColor()
            ),
          ),
        ],
      ),
    );
  }

  Padding _rowList(String description, String listOfData) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Text(description, style: TextStyle(fontSize: 15)),
          Flexible(
              child: Container(
                  child: Text(
            listOfData,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: _defineTextColor()
            ),
          ))),
        ],
      ),
    );
  }

  Divider _buildDivider(BuildContext context) {
    int widthMargin = 8;
    return Divider(
      indent: MediaQuery.of(context).size.width / widthMargin,
      endIndent: MediaQuery.of(context).size.width / widthMargin,
      thickness: 1,
      // color: _defineTextColor(),
    );
  }

}
