import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sequencing_apps/screen/result_screen.dart';

class GameScreen extends StatelessWidget {
  int dropdownValue;
  List<String> names;
  GameScreen({required this.names,
    required this.dropdownValue,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('asset/free-icon-french-fries-1057356.png'),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: () async {
                    final rand = Random();
                    int number = rand.nextInt(16) + 4;

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context){
                        return ResultScreen(dropdownValue: dropdownValue, names: names,);
                      })
                    );
                  },
                  child: Text(
                    '뽑기!',
                    style: theme.textTheme.bodyText1,
                    ),
                  ),
            ],
          ),
        ));
  }
}
