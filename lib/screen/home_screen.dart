import 'package:flutter/material.dart';
import 'package:sequencing_apps/screen/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '감튀 뽑기 얍!',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 70.0,
                  fontFamily: 'jua',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SettingsScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  '게임 시작!',
                  style: theme.textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}