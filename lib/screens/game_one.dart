import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ndialog/ndialog.dart';
import 'package:simple_game/utils/app_themes.dart';
import 'package:simple_game/utils/common_calculations.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SwipeToMatchNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swipe to Match",
      theme: ShitabsThemeMaker.getSwipeToMatchNumberTheme(),
      home: _SwipeToMatchNumber(title: "Swipe to Match",),
    );
  }

}

class _SwipeToMatchNumber extends StatefulWidget {
  _SwipeToMatchNumber({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return SwipeToMatchNumberState();
  }
}

class SwipeToMatchNumberState extends State<_SwipeToMatchNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Swipe till $_targetNumber",
          style: ShitabsThemeMaker.getAppBarTextStyle(),
        ),
      ),
      body: SimpleGestureDetector(
        onVerticalSwipe: _verticalSwipe,
        onHorizontalSwipe: _horizontalSwipe,
        child: Container(
          padding: EdgeInsets.all(30.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                key: Key("id:elevatedButtonTop"),
                child: Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: ShitabsThemeMaker.getButtonTextStyle(),
                ),
                onPressed: () {
                  _verticalSwipe(SwipeDirection.up);
                },

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    key: Key("id:elevatedButtonLeft"),
                    child:
                    Text(
                      "+",
                      textAlign: TextAlign.center,
                      style: ShitabsThemeMaker.getButtonTextStyle(),
                    ),
                    onPressed: () {
                      _horizontalSwipe(SwipeDirection.left);
                    },
                  ),

                  Text(
                    "$_initialNumber",
                    key: Key("id:textNumber"),
                    style: TextStyle(
                      fontSize: 90,
                    ),
                  ),

                  ElevatedButton(
                    key: Key("id:elevatedButtonRight"),
                    child:
                    Text(
                      "-",
                      textAlign: TextAlign.center,
                      style: ShitabsThemeMaker.getButtonTextStyle(),
                    ),
                    onPressed: () {
                      _horizontalSwipe(SwipeDirection.right);
                    },
                  )
                ],
              ),
              ElevatedButton(
                key: Key("id:elevatedButtonBottom"),
                child: Text(
                  "-",
                  textAlign: TextAlign.center,
                  style: ShitabsThemeMaker.getButtonTextStyle(),
                ),
                onPressed: () {
                  _verticalSwipe(SwipeDirection.down);
                },

              ),
              ElevatedButton(
                key: Key("id:elevatedButtonReset"),
                child: Text(
                  "Reset",
                  textAlign: TextAlign.center,
                  style: ShitabsThemeMaker.getButtonTextStyle(),
                ),
                onPressed: () {
                  _resetFunction();
                },

              ),

            ],
          ),
        ),
      ),
    );
  }

  int _initialNumber = ShitabsCalculator.getRandomNumber(100, -100);
  int _targetNumber = ShitabsCalculator.getRandomNumber(100, -100);
  int _horizontalDecay = ShitabsCalculator.getRandomNumber(9, 2);
  int _verticalDecay = ShitabsCalculator.getRandomNumber(9, 2);

  void _resetFunction() {
    setState(() {
      _initialNumber = ShitabsCalculator.getRandomNumber(100, -100);
      _targetNumber = ShitabsCalculator.getRandomNumber(100, -100);
      _horizontalDecay = ShitabsCalculator.getRandomNumber(9, 2);
      _verticalDecay = ShitabsCalculator.getRandomNumber(9, 2);

      checkGameOver();
    });
  }

  void _horizontalSwipe(SwipeDirection direction) {
    setState(() {
      if(direction == SwipeDirection.left)
        _initialNumber = _initialNumber + _horizontalDecay;
      else _initialNumber = _initialNumber - _horizontalDecay;

      checkGameOver();
    });
  }

  void _verticalSwipe(SwipeDirection direction) {
    setState(() {
      if(direction == SwipeDirection.up)
        _initialNumber = _initialNumber + _verticalDecay;
      else _initialNumber = _initialNumber - _verticalDecay;

      checkGameOver();
    });
  }

  void checkGameOver() {
    if (_initialNumber == _targetNumber) {
      NAlertDialog(
        key: Key("id:nAlertDialog"),
        title: Text(
            "Got it right!!!"
        ),
        dismissable: false,
        blur: 2,
          actions: <Widget>[
            TextButton(
              child: Text(
                  "Play Again"
              ),
              onPressed: () {
                Navigator.pop(context);
                _resetFunction();
              },
            ),
            TextButton(
              child: Text(
                  "Nah!"
              ),
              onPressed: () {
                Navigator.pop(context);
                _resetFunction();
              },
            ),
            TextButton(
              child: Text("Enough for today!"),
              onPressed: () {
                _resetFunction();
                Navigator.pop(context);
                SystemNavigator.pop();
              },
            )
          ]
      ).show(context, transitionType: DialogTransitionType.Bubble);
    }
  }

}

