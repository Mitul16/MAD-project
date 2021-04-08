import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:mad_app/simple_button.dart';

const String websiteURL = 'https://www.who.int/';

class WHOWebsite extends StatefulWidget {
  @override
  WHOWebsiteState createState() => WHOWebsiteState();
}

class WHOWebsiteState extends State<WHOWebsite> {
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('WHO'),
            SimpleButton(
              icon: Icons.home,
              onTap: () {
                _webViewController.currentUrl().then((current) {
                  print(current);

                  if (current != websiteURL) {
                    _webViewController.loadUrl(websiteURL);
                  }
                  else {
                    _webViewController.scrollTo(0, 0);
                  }
                });
              },
            ),
          ],
        ),
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          WebView(
            initialUrl: websiteURL,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },
            gestureRecognizers: Set()
              ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SimpleButton(
                    onTap: () {
                      _webViewController.canGoBack().then((canGoBack) {
                        if (canGoBack) {
                          _webViewController.goBack();
                        }
                        else {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                            content: Text(
                              'Cannot go back!',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                          ));
                        }
                      });
                    },
                    icon: Icons.arrow_back_rounded,
                    size: 48,
                  ),
                  SimpleButton(
                    onTap: () {
                      _webViewController.canGoForward().then((canGoForward) {
                        if (canGoForward) {
                          _webViewController.goForward();
                        }
                        else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                              content: Text(
                                'Cannot go forward!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Comfortaa',
                                ),
                              ),
                              padding: EdgeInsets.all(8)
                            ),
                          );
                        }
                      });
                    },
                    icon: Icons.arrow_forward_rounded,
                    size: 48,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}