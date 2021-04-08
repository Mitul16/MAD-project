import 'package:flutter/material.dart';
import 'globals.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        leading: ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor,
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        // Show the result
        // use the BMI value in account with the color of something
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 16,
          children: <Widget>[
            Ink(
              decoration: BoxDecoration(
                color: (bmiValue < 18.5 ? Colors.blue :
                bmiValue < 25 ? Colors.green :
                bmiValue < 30 ? Colors.yellow : Colors.red).withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: EdgeInsets.all(8),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            'BMI Score',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Shadows Into Light Two',
                            ),
                          ),
                        ),
                        Text(
                          bmiValue < 100 ? '$bmiValue' : '>100',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Shadows Into Light Two',
                            ),
                          ),
                        ),
                        Text(
                          bmiValue < 18.5 ? 'Underweight' :
                          bmiValue < 25 ? 'Healthy' :
                          bmiValue < 30 ? 'Pre-obesity' :
                          bmiValue < 35 ? 'Obesity class I' :
                          bmiValue < 40 ? 'Obesity class II' :
                          bmiValue < 45 ? 'Obesity class III' : 'DAMN!!!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: images,
            ),
            Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: EdgeInsets.all(8),
              child: Wrap(
                children: <Widget>[
                  Align(
                    alignment: FractionalOffset(
                        bmiValue < 18.5 ? (bmiValue - 0) / (18.5 - 0) * 0.2 :
                        bmiValue < 25 ? 0.225 + (bmiValue - 18.5) / (25 - 18.5) * (0.5 - 0.225) :
                        bmiValue < 30 ? 0.5 + (bmiValue - 25) / (30 - 25) * (0.775 - 0.5) :
                        bmiValue < 45 ? 0.775 + (bmiValue - 30) / (45 - 30) * (1 - 0.775) : 1, 0
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Ink(
                          child: Text('', style: TextStyle(fontSize: 20)),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Ink(
                          child: Text('', style: TextStyle(fontSize: 20)),
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Ink(
                          child: Text('', style: TextStyle(fontSize: 20)),
                          color: Colors.yellow,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Ink(
                          child: Text('', style: TextStyle(fontSize: 20)),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(0, 0),
                        child: Text(
                          '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset(0.225, 0),
                        child: Text(
                          '18.5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset(0.5, 0),
                        child: Text(
                          '25.0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset(0.775, 0),
                        child: Text(
                          '30.0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset(1, 0),
                        child: Text(
                          '>45',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Shadows Into Light Two',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}