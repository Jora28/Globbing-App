import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _value = true;
  String _setName = "Русский";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
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
                    "Настройки",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1), color: Colors.grey, blurRadius: 1)
                ]),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.notifications_on_outlined,
                      color: Colors.black),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                Container(
                  child: Text("Получать уведомления"),
                ),
                Spacer(),
                Container(
                  child: Switch(
                    value: _value,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    onChanged: (val) {
                      setState(() {
                        _value = val;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          _listBuild(list.length, list),
        ],
      ),
    );
  }

  seticon(name) {
    setState(() {
      _setName = name;
    });
  }

  Widget _listBuild(
    int length,
    List<Language> info,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 5)
          ],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  seticon(info[i].name);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: i == info.length - 1
                                  ? Colors.white
                                  : Colors.grey,
                              width: 0.5))),
                  child: Container(
                    height: 50,
                    // margin: EdgeInsets.symmetric(vertical:15),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage(info[i].image),
                                  fit: BoxFit.cover)),
                        ),
                        Container(child: Text("${info[i].name}")),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.check,
                            color: info[i].name == _setName
                                ? Colors.green
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}

class Language {
  String name;
  String image;

  Language(this.name, this.image);
}

List<Language> list = [
  Language("Английскийй", "assets/gb.png"),
  Language("Русский", "assets/rus.png"),
  Language("Армянский", "assets/arm.png"),
];
