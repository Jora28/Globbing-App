import 'package:flutter/material.dart';

class ConectPage extends StatefulWidget {
  ConectPage({Key key}) : super(key: key);

  @override
  _ConectPageState createState() => _ConectPageState();
}

class _ConectPageState extends State<ConectPage> {
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
                    "Как пользоваться",
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
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text("Обратная связь"),
              margin: EdgeInsets.only(bottom: 50, left: 20)),
          Container(
            child: Row(children: [
              _card("Отправить сообшение", Icon(Icons.email)),
              _card("Позвонить", Icon(Icons.call)),
            ]),
          ),
          Container(
              decoration: BoxDecoration(color: Colors.grey[400]),
              height: 1,
              margin:
                  EdgeInsets.only(bottom: 50, left: 20, top: 35, right: 20)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text("Подписывайтесь на нашу страницув")
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Row(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/fb.png"),fit: BoxFit.cover)),
                                    ),
                                    Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/inst.png"),fit: BoxFit.cover)),
                                    ),
                                    Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/youtube.png"),fit: BoxFit.cover)),
                                    ),
                                ],
                              ),
                              )
                      ],
                    ),
                  ),
                  Expanded(child: Image.asset("assets/user_logo.jpg")),
                ],
              )),
        ],
      ),
    );
  }

  Widget _card(String text, Icon icon) {
    return Container(
      height: 120,
      width: 150,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 2)
          ]),
      child: Row(children: [
        Container(
          child: Column(children: [
            Container(
              child: icon,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
            Container(
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "$text",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ))
          ]),
        ),
      ]),
    );
  }
}
