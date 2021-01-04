import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/calculate_page.dart';
import 'package:globbing_app/more_screens/help_page.dart';
import 'package:globbing_app/more_screens/notification_page.dart';
import 'package:globbing_app/more_screens/person_info.dart';
import 'package:globbing_app/more_screens/place_reciver.dart';
import 'package:globbing_app/more_screens/reciver_page.dart';
import 'package:globbing_app/more_screens/settings_page.dart';
import 'package:globbing_app/more_screens/trnzaction_page.dart';

class MorePage extends StatefulWidget {
  MorePage({Key key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  List<Info> info = [
    Info("Калькулятор", Icon(Icons.calculate_outlined,)),
    Info("Транзакции", Icon(Icons.credit_card_outlined,)),
    Info("Персональные данные", Icon(Icons.account_circle_outlined,)),
    Info("Получатели", Icon(Icons.supervised_user_circle_outlined,)),
    Info("Основное место получателя", Icon(Icons.store_outlined,)),
  ];

  List<Info> settings = [
    Info("Настройки", Icon(Icons.settings_outlined,)),
    Info("Помощь", Icon(Icons.help_outline,))
  ];

  List<Widget> bodyWidget = [
    CalculatePage(),
    TranzaktionPage(),
    PersonInfo(),
    ReciverPage(),
    PlaceReciverPage(),
  ];
  List<Widget> bodyWidgetSettings = [
    SettingPage(),
    HelpPage()
  ];
  Widget _body() {
    //Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/back.jpg"),fit: BoxFit.cover)),
      child: ListView(
        children: [
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(
                              image: AssetImage("assets/user_logo.jpg"),
                              fit: BoxFit.cover)
                          ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Jora Mkrtchyan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.expand_more,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ));
                      },
                                          child: Container(
                        child: Icon(
                          
                          Icons.notifications,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                )),
          
          _listBuild(info.length,info,bodyWidget),
          _listBuild(settings.length,settings,bodyWidgetSettings),
          _logout()
        ],
      )
    );
  }

  Widget _logout(){
    return Container(
      margin: EdgeInsets.only(left: 25,top: 35),
      child: Row(
        children: [
          Container(child: Icon(Icons.logout,size: 30,),margin: EdgeInsets.only(right:10),),
          Container(child: Text("Выйти"),)
        ],

      ),
    );
  }

  Widget _listBuild(int length,List<Info> info,List<Widget> list ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 5)
          ],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>list[i],
                          settings: RouteSettings(arguments: info[i].name)
                          ));
                },
                child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color:
                              i == info.length - 1 ? Colors.white : Colors.grey,
                          width: 0.5))),
              child: Container(
                height:50 ,
               // margin: EdgeInsets.symmetric(vertical:15),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:14),
                      child:info[i].icon
                      ),
                    Container(child:Text("${info[i].name}")),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right:10),
                      child: Icon(Icons.keyboard_arrow_right),)
                ],),
              ),
            ));
          }),
    );
  }
}

class Info {
  String name;
  Icon icon;
  StatefulWidget widget;

  Info(this.name, this.icon);
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
