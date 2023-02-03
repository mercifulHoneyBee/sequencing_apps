import 'package:flutter/material.dart';
import 'package:sequencing_apps/screen/game_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<int> MenuType = [2, 3, 4, 5, 6, 7, 8];
  int dropdownValue = 2;
  String name = '';
  List<String> names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          '감튀 뽑기 게임 :',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.0,
                            fontFamily: 'jua',
                          ),
                        ),
                        Text(
                          '뽑은 감튀의 길이대로 순위를 매기는 간단한 게임!',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.0,
                            fontFamily: 'jua',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '인원 수',
                          style: TextStyle(
                            fontFamily: 'jua',
                            fontSize: 20.0,
                          ),
                        ),
                        DropdownButton(
                          value: dropdownValue,
                          items: MenuType.map((value) => DropdownMenuItem(
                                value: value,
                                child: Text('$value'),
                              )).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          elevation: 7,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < dropdownValue; i++)
                        TextField(
                          onSubmitted: (Name) {
                            setState(() {
                              name = Name;
                              names.add(name);
                            });
                          },
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '이름을 적어주세요',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                _BottomPart(dropdownValue: dropdownValue, names: names,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  int dropdownValue;
  List<String> names;
  _BottomPart({required this.names, required this.dropdownValue, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
      ),
      onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return GameScreen(
              dropdownValue: dropdownValue,
              names: names,
            );
          },
        ));
      },
      child: Text(
        '주문 완료!',
        style: theme.textTheme.bodyText1,
      ),
    );
  }
}
