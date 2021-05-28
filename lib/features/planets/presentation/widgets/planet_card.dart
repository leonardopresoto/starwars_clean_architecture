import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/features/planets/domain/entities/planet.dart';


const Color carContent_TextColor = Colors.white;

class PlanetCard extends StatefulWidget {
  final Planet planet;

  PlanetCard(this.planet);

  @override
  _PlanetCardState createState() => _PlanetCardState();
}

class _PlanetCardState extends State<PlanetCard> {

  double _size = 96;
  IconData _icon = Icons.keyboard_arrow_up;
  Widget? _row;
  @override
  Widget build(BuildContext context) {
    _row = _buildRow(1);
    final planetThumbnail = Container(
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage(widget.planet.image!),
        height: 80.0,
        width: 80.0,
      ),
    );

    Widget _planetValue({String? value, required String description}) {
      return Row(children: <Widget>[
        Text(description, style: TextStyle(color: carContent_TextColor),),
        Container(width: 4.0),
        Expanded(
          child: Text(
            (value != null)? value:"n/a",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, color: carContent_TextColor),
          ),
        ),
      ]);
    }

    final planetCardContent = Container(
      margin: EdgeInsets.only(left: 60.0, top: 8, right: 8.0, bottom: 8),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
        Text(widget.planet.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carContent_TextColor),),
            IconButton(icon: Icon(_icon), onPressed: () {
              setState(() {
                if(_size == 96){
                  _size = 300;
                  _icon = Icons.keyboard_arrow_down;
                  _row = _buildRow(10);
                }else{
                  _size = 96;
                  _icon = Icons.keyboard_arrow_up;
                  _row = _buildRow(1);
                }
              });
            })
      ]),
          _row!
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      margin: EdgeInsets.only(left: 25.0),
      decoration: BoxDecoration(
        color: PLANET_CARD_COLOR,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return Container(
        height: _size,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }

  Widget _buildRow(int z) {
    List<Widget> list = [];
    for(var i = 0; i < z; i++){
      list.add(Text(i.toString()));
    }
    return Column(children: list);
  }
}
