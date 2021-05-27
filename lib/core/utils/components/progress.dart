import 'package:flutter/material.dart';
import 'package:starwars_clean_architecture/core/config/app_colors.dart';
import 'package:starwars_clean_architecture/core/utils/components/utils.dart';

class Progress extends StatelessWidget {

  const Progress({
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
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  (Utils().isLightTheme()) ? Colors.white : Color(0xFF212121)),
              backgroundColor:
                  (Utils().isLightTheme()) ? Colors.purple : YELLOW_STARWARS,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Loading ...',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: (Utils().isLightTheme())
                        ? Colors.purple
                        : YELLOW_STARWARS),
              ),
            )
          ],
        ),
      ),
    );
  }
}
