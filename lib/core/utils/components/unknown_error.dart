import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';

class UnknownError extends StatelessWidget {
  const UnknownError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils().screenSafeAreaHeight(context) - 24,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_down_alt,
              color: CONNECTION_ERROR,
              size: 250,
            ),
            Text(
              "Data Download Error",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "An unknown error has ocurred",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
