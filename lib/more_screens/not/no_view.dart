import 'package:flutter/material.dart';

class NoView extends StatefulWidget {
  NoView({Key key}) : super(key: key);

  @override
  _NoViewState createState() => _NoViewState();
}

class _NoViewState extends State<NoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(child:Text("Уведомлений пока нет")),
    );
  }
}