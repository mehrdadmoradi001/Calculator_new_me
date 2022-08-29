import 'package:calculator_new_me/constant/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorNewMe());
}

class CalculatorNewMe extends StatefulWidget {
  const CalculatorNewMe({Key? key}) : super(key: key);

  @override
  State<CalculatorNewMe> createState() => _CalculatorNewMeState();
}

class _CalculatorNewMeState extends State<CalculatorNewMe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgPageBottom,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: AlignmentDirectional(0, -4),
                      colors: <Color>[
                        bgPageBottom,
                        bgPageTop,
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: bgPageBottom,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeyBoardButtons('C', '7', '4', '1', '%'),
                      KeyBoardButtons('/', '8', '5', '2', '0'),
                      KeyBoardButtons('*', '9', '6', '3', '.'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          getElevatedButtonsRight('<'),
                          getElevatedButtonsRight('-'),
                          getElevatedButtonsRight('+'),
                          getExpandElevatedButtons(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget KeyBoardButtons(tex1, text2, text3, text4, text5) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getElevatedButtons(tex1),
        getElevatedButtons(text2),
        getElevatedButtons(text3),
        getElevatedButtons(text4),
        getElevatedButtons(text5),
      ],
    );
  }

  var topList = ['/', '*'];

  bool isOperator(String text) {
    //
    for (var item in topList) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundTop(String text) {
    if (isOperator(text)) {
      return bgTextButtonsTop;
    } else if(text =='C'){
      return coYellow;
    }else{
      return bgTextButtons;
    }
  }

  Color getBackgroundTopText(String text) {
    if (isOperator(text)) {
      return coTextButtonsTop;
    } else {
      return Colors.white;
    }
  }




  Widget getElevatedButtons(String text) {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: Colors.white,
        elevation: 1,
        backgroundColor: getBackgroundTop(text),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: getBackgroundTopText(text)),
        ),
      ),
    );
  }

  Widget getElevatedButtonsRight(String textRight) {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: Colors.white,
        elevation: 1,
        backgroundColor: bgTextButtonsRight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
        child: Text(
          textRight,
          style: TextStyle(fontSize: 25, color: coTextButtonsRight),
        ),
      ),
    );
  }

  Widget getExpandElevatedButtons() {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: Colors.white,
        elevation: 1,
        backgroundColor: coEqual,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(numO),
            topRight: Radius.circular(numO),
            bottomRight: Radius.circular(numO),
            bottomLeft: Radius.circular(numO),
          ),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 53, horizontal: 22),
        child: Text(
          '=',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  double numO = 50;
}
