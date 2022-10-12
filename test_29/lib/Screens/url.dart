import 'package:flutter/material.dart';
import 'package:test_29/Screens/utils/custome_string.dart';
import 'package:test_29/Screens/webview.dart';


class HomePageOne extends StatelessWidget {
  final _links =[CustomeStrings.url];

   HomePageOne({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _links.map((link) => _urlButton(context, link)).toList(),
                ))));
  }
  Widget _urlButton(BuildContext context, String url) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          child: const Text(CustomeStrings.url),
          onPressed: () => _handleURLButtonPress(context, url),


        ));
  }
  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomePageOnly()));
  }
}