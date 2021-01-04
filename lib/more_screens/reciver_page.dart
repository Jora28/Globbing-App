import 'package:flutter/material.dart';

class ReciverPage extends StatefulWidget {
  ReciverPage({Key key}) : super(key: key);

  @override
  _ReciverPageState createState() => _ReciverPageState();
}

class _ReciverPageState extends State<ReciverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: _person(),
    );
  }

  Widget _person() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 5)
            ],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>bodyWidget[i],
            //           settings: RouteSettings(arguments: info[i].name)
            //           ));
            // },
            child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.white, width: 0.5))),
          child: Container(
            height: 45,
            // margin: EdgeInsets.symmetric(vertical:15),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 14),
                    child: Container(
                      height:30,
                      width: 30,
                      child: Container(child: Text("JM"),margin: EdgeInsets.symmetric(vertical: 6,horizontal: 3),),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.blue[100]),
                      ) 
                    ),
                Container(child: Text("Jora Mkrtchyan")),
                Spacer(),
                Container( child: Text("основной",style:TextStyle(color: Colors.orange),)),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ],
            ),
          ),
        )));
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
                    "Другие получатели",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }
}
