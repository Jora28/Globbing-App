import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/not/all.dart';

class SmsPage extends StatefulWidget {
  SmsPage({Key key}) : super(key: key);

  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  @override
  Widget build(BuildContext context) {
    final SmsInfo info = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Подробности уведомления",style: TextStyle(fontSize: 15),),),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.all( 15),
        width: MediaQuery.of(context).size.width,
        child: Text(info.text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      Container(
          margin: EdgeInsets.only(left: 15),
          child: Row(children: [
            Icon(
              Icons.calendar_today,
              color: Colors.cyan[800],
              size: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "${info.dateTime.year}-${info.dateTime.month}-${info.dateTime.day}  ${info.time.hour}:${info.time.minute}",
                style: TextStyle(color: Colors.cyan[800], fontSize: 15),
              ),
            ),
          ]))
    ]));
  }
}
