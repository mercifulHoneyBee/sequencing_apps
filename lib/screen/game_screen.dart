import 'package:flutter/material.dart';
import 'package:sequencing_apps/screen/result_screen.dart';

class GameScreen extends StatelessWidget {
  int dropdownValue;
  List<String> names;
  GameScreen({required this.names,
    required this.dropdownValue,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double posx = 0;
    double posy = 0;
    double x_maxValue = MediaQuery.of(context).size.width;
    double y_maxValue = MediaQuery.of(context).size.height;
    int touch = 0;
    void onTapDown(BuildContext context, TapDownDetails details) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final Offset localOffset = box.globalToLocal(details.globalPosition);
      posx = localOffset.dx;
      posy = localOffset.dy;}
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTapDown: (TapDownDetails details) => onTapDown(context, details),
          onTap: () {
            if (posx < x_maxValue / 3) {
              if (posy < y_maxValue / 3) {
                touch = 1;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              } else if (posy > y_maxValue / 3 && posy < (y_maxValue / 3) * 2) {
                touch = 4;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              } else if (posy > (y_maxValue / 3) * 2) {
                touch = 7;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              }
            } else if ((x_maxValue / 3) * 2 > posx && posx > x_maxValue / 3) {
              if (posy < y_maxValue / 3) {
                touch = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              } else if (posy > y_maxValue / 3 && posy < (y_maxValue / 3) * 2) {
                touch = 5;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              } else if (posy > (y_maxValue / 3) * 2) {
                touch = 8;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              }
            } else if ((x_maxValue / 3) * 2 < posx) {
              if (posy < y_maxValue / 3) {
                touch = 3;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              } else if (posy > y_maxValue / 3 && posy < (y_maxValue / 3) * 2) {
                touch = 6;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              } else if (posy > (y_maxValue / 3) * 2) {
                touch = 9;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          names: names, dropdownValue: dropdownValue, touch: touch);
                    },
                  ),
                );
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('asset/free-icon-french-fries-1057356.png'),
                Text(
                  '아무 곳이나 터치해주세요',
                  style: TextStyle(
                      color: Colors.black12, fontFamily: 'jua', fontSize: 40.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
