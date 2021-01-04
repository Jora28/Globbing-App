import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/conect_page.dart';
import 'package:globbing_app/more_screens/forbidden_page.dart';
import 'package:globbing_app/more_screens/how_to_explain.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _listBuild(help),
    );
  }

  Widget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 42),
            decoration: BoxDecoration(color: Color.fromRGBO(46, 61, 77, 1)),
            child: Column(children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      )),
                  Text(
                    "Помощь",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }

  Widget _listBuild(List<Info> info) {
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
          itemCount: info.length,
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
                height: 50,
                // margin: EdgeInsets.symmetric(vertical:15),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 14),
                        child: info[i].icon 
                        ),
                    Container(child: Text("${info[i].name}")),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child:Icon(Icons.keyboard_arrow_right),
                    )
                  ],
                ),
              ),
            ));
          }),
    );
  }
}

class Info {
  String name;
  Icon icon;
  Info(this.name, this.icon);
}

List<Widget> list = [
  ForbiddenPage(),
  HowToDo(),
  ConectPage()
];

List<Info> help = [
  Info(
    "Запрещенные товары",
    Icon(
      Icons.work_off_outlined,
    ),
  ),
  Info(
    "Как пользоваться",
    Icon(
      Icons.help_outline,
    ),
  ),
  Info(
    "Обратная связь",
    Icon(
      Icons.contact_mail_outlined,
    ),
  )
];
