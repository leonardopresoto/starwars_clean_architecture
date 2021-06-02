import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final String title;
  final String subtitle;
  final String image;
  final Function onClick;

  DashboardCard(
    this.title,
    this.subtitle,
    this.firstColor,
    this.secondColor,
    this.image, {
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: _buildBorderRadius(),
      ),
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
            width: double.maxFinite,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: _buildBorderRadius(),
              gradient: LinearGradient(colors: [firstColor, secondColor]),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 23,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 24, right: 24.0, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.left),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            subtitle,
                            style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            )),
      ),
    );
  }

  BorderRadius _buildBorderRadius() {
    return BorderRadius.only(
        topRight: Radius.circular(20), bottomLeft: Radius.circular(20));
  }
}
