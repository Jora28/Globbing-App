import 'package:flutter/material.dart';

class BuyMyself extends StatefulWidget {
  BuyMyself({Key key}) : super(key: key);

  @override
  _BuyMyselfState createState() => _BuyMyselfState();
}

class _BuyMyselfState extends State<BuyMyself> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Купи вместо меня"),),
          body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset("assets/icon_order.jpg"),
             Container(
               margin: EdgeInsets.only(top:20),
               width: MediaQuery.of(context).size.width *0.4,
               child: Text("Сервис пока недоступен в приложении",style: TextStyle(color: Colors.cyan[800],fontSize: 20),textAlign: TextAlign.center,))
           ],
         )
      ),
    );
  }
}