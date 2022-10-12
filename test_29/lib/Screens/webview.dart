


import 'dart:async';

import 'package:flutter/material.dart';

import 'package:test_29/Screens/utils/custome_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageOnly extends StatefulWidget {
  const HomePageOnly({Key? key}) : super(key: key);

  @override
  State<HomePageOnly> createState() => _HomePageOnlyState();
}

class _HomePageOnlyState extends State<HomePageOnly> {
  Completer <WebViewController> _c = Completer<WebViewController>();





  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body:


      WebView(
        initialUrl: CustomeStrings.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _c.complete(webViewController);
        },
      ),






    );
  }
}
