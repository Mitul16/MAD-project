import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mad_app/result_page.dart';
import 'package:mad_app/item_widget.dart';
import 'package:mad_app/utils.dart';
import 'package:mad_app/globals.dart';

class BMICalculatorPage extends StatefulWidget {
  BMICalculatorPage({Key key}) : super(key: key);

  @override
  _BMICalculatorPage createState() => _BMICalculatorPage();
}

class _BMICalculatorPage extends State<BMICalculatorPage> {
  ItemWidget _itemHeight = ItemWidget(
    name: 'Height',
    unitCount: 3,
    units: ['cms', 'inches', 'feet'],
    starts: [30, 12, 1],
    ends: [240, 96, 8],
    unitConversionMappings: [
      1.0, 12.0/30.0, 1.0/30.0,
      30.0/12.0, 1.0, 1.0/12.0,
      30.0, 12.0, 1.0
    ],
    controller: ItemWidgetController(),
  ), _itemWeight = ItemWidget(
    name: 'Weight',
    unitCount: 2,
    units: ['kgs', 'pounds'],
    starts: [0, 0],
    ends: [250, 500],
    unitConversionMappings: [
      1.0, 2.20462,
      0.453592, 1.0
    ],
    controller: ItemWidgetController(),
  );

  _BMICalculatorPage() {
    bmiValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate BMI'),
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
        child: Wrap(
          runSpacing: 8,
          children: <Widget>[
            _itemHeight,
            _itemWeight,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        height: 48,
        child: FloatingActionButton.extended(
          heroTag: 'homePage',
          onPressed: () => {
            updateBMI(),
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => ResultPage()),
            )
          },
          label: Text(
            'Calculate',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Comfortaa',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void updateBMI() {
    bmiValue = calculateBMI(_itemWeight.controller.getConvertedValue(), _itemHeight.controller.getConvertedValue() / 100.0);
  }
}