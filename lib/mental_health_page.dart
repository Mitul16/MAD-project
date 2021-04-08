import 'package:flutter/material.dart';
import 'package:mad_app/globals.dart';

double _currentSliderValue = 0;
double _happyMeter = 0;
double _productivity = 0;

class MentalHealthPage extends StatefulWidget {
  MentalHealthPage({Key key}) : super(key: key);

  @override
  _MentalHealthPageState createState() => _MentalHealthPageState();
}

class _MentalHealthPageState extends State<MentalHealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health'),
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Text(
                'A Simple Survey!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
            Image(
              image: AssetImage(mentalHealthAssetNames[0]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
              child: Text(
                'Select the number of people you met today!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
              child: Text(
                'How happy do you feel today?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
            Slider(
              value: _happyMeter,
              min: 0,
              max: 100,
              divisions: 100,
              label: _happyMeter.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _happyMeter = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
              child: Text(
                'How Productive Do You Feel Today?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
            Slider(
              value: _productivity,
              min: 0,
              max: 100,
              divisions: 100,
              label: _productivity.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _productivity = value;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                  child: const Icon(Icons.arrow_forward, color: Colors.white,),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals!'),
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
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Goals For the Next Day!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa'),
                  ),
                ),
                if (_currentSliderValue <= 5)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                    child: Text(
                      'Talk to atleast 6 peoples tomorrow!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Comfortaa'),
                    ),
                  ),
                if (_currentSliderValue <= 5)
                  Image(
                    image: AssetImage(mentalHealthAssetNames[1]),
                  ),
                if (_happyMeter <= 50)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                    child: Text(
                      'Focus on what makes you \'Happy\'',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Comfortaa'),
                    ),
                  ),
                if (_happyMeter <= 50)
                  Image(
                    image: AssetImage(mentalHealthAssetNames[2]),
                  ),
                if (_productivity <= 50)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                    child: Text(
                      'Try to get some Work Done!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Comfortaa'),
                    ),
                  ),
                if (_productivity <= 50)
                  Image(
                    image: AssetImage(mentalHealthAssetNames[3]),
                  ),
                if(_productivity>50 && _currentSliderValue>5 && _happyMeter>50)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                    child: Text(
                        'No tasks for you , Relax!!',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Comfortaa'),
                    ),
                  ),
                if(_productivity>50 && _currentSliderValue>5 && _happyMeter>50)
                  Image(
                    image: AssetImage(mentalHealthAssetNames[4]),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
