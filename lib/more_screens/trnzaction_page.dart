import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/filter_tanz_page.dart';


class TranzaktionPage extends StatefulWidget {
  TranzaktionPage({Key key}) : super(key: key);

  @override
  _TranzaktionPageState createState() => _TranzaktionPageState();
}

class _TranzaktionPageState extends State<TranzaktionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FilterTranz()));
          },
        ),
        body: Column(children: []));
  }

  Widget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 40),
            decoration: BoxDecoration(color: Color.fromRGBO(46, 61, 77, 1)),
            child: Column(children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                                              child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      )),
                  Text(
                    "Транзакции",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              
              
              Container(
                margin: EdgeInsets.only(top:20),
                child: Row(
                  children: [
                 
                 
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "БАЛАНС",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(Icons.account_balance_wallet,
                                  color: Colors.white)),
                          Text(
                            "0",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "AMD",
                              style: TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                
                
                Container(
                  margin: EdgeInsets.only(left:40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "БОНУС",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "AMD",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                
                ]),
              )
            ])));
  }
}
