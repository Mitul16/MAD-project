import 'package:flutter/material.dart';

double _currentSliderValue = 0;
double _happyMeter = 0;
double _productivity = 0;

class MentalHealth extends StatelessWidget {
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
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Text('A Simple Servey !',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ),
          Image(
            image: AssetImage('images/pale-mental-health.png'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            child: Text('Select the number of people you met today !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
            child: Text('How happy do you feel today?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            child: Text('How Productive Do You Feel Today?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                child: const Icon(Icons.arrow_forward),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ]),
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
                child: Text('Goals For the Next Day!' ,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              if (_currentSliderValue <= 5)
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                  child: Text('Talk to atleast 6 peoples tomorrow!',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              if (_currentSliderValue <= 5)
                Image(
                  image: AssetImage('images/pablita-success.png'),
                ),
              if (_happyMeter <= 50)
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                  child: Text('Focus on what makes you \'Happy\'',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              if (_happyMeter <= 50)
                Image(
                  image: AssetImage('images/clip-end-of-quarantine-happy-and-joyful-girl-1.png'),
                ),
              if (_productivity <= 50)
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                  child: Text('Try to get some Work Done!',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              if (_productivity <= 50)
                Image(
                  image: AssetImage('images/clip-remote-work-1.png'),
                ),
              if(_productivity>50 && _currentSliderValue>5 && _happyMeter>50)
                Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 20.0, 3.0, 1.0),
                  child: Text('No tasks for you , Relax!!',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              if(_productivity>50 && _currentSliderValue>5 && _happyMeter>50)
                Image(
                image: AssetImage('images/pablo-800.png'),),



            ],
          ),
        ),
      )),
    );
  }
}
