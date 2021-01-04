import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/not/sms_page.dart';

class All extends StatefulWidget {
  All({Key key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}
class SmsInfo{
DateTime dateTime;
String text;
TimeOfDay time;
SmsInfo(this.dateTime,this.text,this.time);
}



class _AllState extends State<All> {
  DateTime dateTime;
  
  TimeOfDay time;

  @override
  void initState() {
    super.initState();

    dateTime = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {

    List<SmsInfo> sms = [
  SmsInfo(dateTime,"Вас приветствует компания GLOBBING.Вы удачно зрегистрировались",time),
  SmsInfo(dateTime,"Вас приветствует компания GLOBBING.Вы удачно зрегистрировались",time),
  SmsInfo(dateTime,"Вас приветствует компания GLOBBING.Вы удачно зрегистрировались",time),
  SmsInfo(dateTime,"Вас приветствует компания GLOBBING.Вы удачно зрегистрировались",time),
];
    return Scaffold(
      body: ListView.builder(
          itemCount: sms.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SmsPage(),
                    settings: RouteSettings(arguments: sms[index])
                  ));
                },
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 300,
                          child: Text(sms[index].text
                              ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.cyan[800],
                                size: 15,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "${sms[index].dateTime.year}-${sms[index].dateTime.month}-${sms[index].dateTime.day}  ${sms[index].time.hour}:${sms[index].time.minute}",
                                  style: TextStyle(
                                      color: Colors.cyan[800], fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      child: Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
