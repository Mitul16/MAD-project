import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mad_app/bmi_calculator_page.dart';
import 'package:mad_app/mental_health_page.dart';
import 'package:mad_app/website_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mad_app/about_page.dart';
import 'package:mad_app/exercises_page.dart';
import 'package:mad_app/globals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  getAppDirPath().then((path) {
    appDirPath = path;
    runApp(MyApp());
  });
}

Future<String> getAppDirPath() async {
  return (await getApplicationSupportDirectory()).path;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthify',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.lightBlue.withOpacity(0.2),
        brightness: Brightness.light,
        canvasColor: Color(0xffffffff),
        accentColor: Colors.lightBlueAccent,
        splashColor: Colors.black38,
        shadowColor: Colors.transparent,
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xff000000),
          inactiveTrackColor: Color(0xff7f7f7f),
          overlayColor: Colors.black38,
          thumbColor: Colors.orange,
          trackHeight: 2,
        ),
        iconTheme: Theme.of(context).iconTheme
            .copyWith(color: Colors.white),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        primaryTextTheme: Theme.of(context).primaryTextTheme
            .apply(
          bodyColor: Colors.white,
          fontFamily: 'Comfortaa',
        ),
        textTheme: Theme.of(context).textTheme
            .apply(bodyColor: Colors.black),
      ),
      home: HomePage(title: 'Healthify'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    for (String assetName in bmiAssetNames) {
      images.add(SvgPicture.asset(
        assetName,
        width: 64,
        height: 128,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(mainAssetImageName),
            fit: BoxFit.cover,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            AppBar(
              title: Text('Menu'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text(
                'My Exercises',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ExercisesPage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Mental Health Status',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => MentalHealthPage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Calculate BMI',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => BMICalculatorPage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Checkout WHO',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => WHOWebsite()),
                );
              },
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
