import 'package:flutter/material.dart';
import 'package:sequencing_apps/screen/home_screen.dart';
import 'dart:math';

class ResultScreen extends StatelessWidget {
  final List<String> names;
  final int dropdownValue, touch;

  const ResultScreen(
      {super.key,
      required this.names,
      required this.dropdownValue,
      required this.touch});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rand = Random();
    List<String> Names = names.toList();
    Names.shuffle();
    if (touch <= dropdownValue) {
      String winner = names[touch - 1];
      while (winner != Names[0]) {
        Names.shuffle();
      }
    }
    List<int> randnumbers = [];
    while (randnumbers.length != dropdownValue) {
      randnumbers.add(rand.nextInt(12) + 3);
      randnumbers = randnumbers.toSet().toList();
    }
    ;
    randnumbers.sort();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black12, width: 10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (int i = 0; i < dropdownValue; i++)
                          Text(
                            '${i + 1}등 ${Names[i]} : ${randnumbers[dropdownValue - i - 1]}.${rand.nextInt(10)}cm',
                            style: TextStyle(
                              fontFamily: 'jua',
                              fontSize: 40.0,
                            ),
                          ),
                      ],
                    ),
                  ),
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
