import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
          alignment: WrapAlignment.center,
          runSpacing: 16,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Created by - ',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          'Binary Bombers',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blueAccent,
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
