import 'package:flutter/material.dart';
import 'package:sequencing_apps/screen/home_screen.dart';
import 'dart:math';

class ResultScreen extends StatelessWidget {
  List<String> names;
  int dropdownValue;
  ResultScreen({required this.names,
    required this.dropdownValue,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rand = Random();
    names.shuffle();
    List<int> randnumbers = [];
    while(randnumbers.length != dropdownValue){
      randnumbers.add(rand.nextInt(16) + 4);
      randnumbers = randnumbers.toSet().toList();
    };
    randnumbers.sort();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < dropdownValue; i++)
                    Text(
                      '${i + 1}등 ${names[i]} : ${randnumbers[dropdownValue - i - 1]}cm',
                      style: TextStyle(
                        fontFamily: 'jua',
                        fontSize: 45.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '한번 더',
                    style: theme.textTheme.bodyText1,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomeScreen();
                    }));
                  },
                  child: Text(
                    '메인 화면',
                    style: theme.textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
