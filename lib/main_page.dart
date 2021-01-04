import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/notification_page.dart';
import 'package:globbing_app/more_screens/trnzaction_page.dart';
import 'package:globbing_app/my_address_page.dart';
import 'package:globbing_app/my_order_page.dart';
import 'package:globbing_app/shops_page.dart';

import 'buy_myself.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _visibale = false;
  double _height = 300;
  double _transformColumn = 0.3;
  double _transformBottom = 0.7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _body() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: _height,
                padding: EdgeInsets.only(left: 25, right: 25, top: 80),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 61, 77, 1),
                  //shape: BoxShape.circle,
                  //borderRadius:BorderRadius.all(Radius.circular(30))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(
                              image: AssetImage("assets/user_logo.jpg"),
                              fit: BoxFit.cover)),
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
          ),
          Container(
            margin:
                EdgeInsets.only(left: 25, right: 25, top: size.height * 0.2),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "БАЛАНС",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "AMD",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
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
                                    color: Colors.white, fontSize: 20),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "AMD",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _visibale = !_visibale;
                                if (_visibale == true) {
                                  _height = 450;
                                  _transformColumn = 0.58;
                                  _transformBottom = 0.95;
                                } else {
                                  _height = 300;
                                  _transformColumn = 0.3;
                                  _transformBottom = 0.7;
                                }
                              });
                            },
                            child: Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Visibility(visible: _visibale, child: DropDown())
              ],
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.only(
              top: size.height * _transformColumn,
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                _info("Мои заказы", "У вас пока нету заказов",
                    AssetImage("assets/icon_order.jpg"), MyOrderPage()),
                _info("Мои адреса", "Аадреса в 7 странах",
                    AssetImage("assets/icon_location.jpg"), MyAddressPage()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: size.height * _transformBottom, bottom: 80),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShopsPage(),
                        ));
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.storefront,
                            color: Colors.cyan[800],
                            size: 40,
                          ),
                          Text(
                            "Магазины",
                            style: TextStyle(color: Colors.cyan[800]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      child: Column(children: [
                    Container(
                      color: Colors.grey,
                      height: 60,
                      width: 1,
                    ),
                  ])),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BuyMyself(),
                        ));
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.cyan[800],
                            size: 40,
                          ),
                          Container(
                            width: 130,
                            child: Text(
                              "Купите вместо меня",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.cyan[800]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _info(String name, String info, AssetImage image, Widget widget) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => widget,
        ));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0, offset: Offset(0, 1), color: Colors.grey)
              ],
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 55,
                  height: 55,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      image: DecorationImage(image: image, fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.normal),
                        )),
                    Container(
                        padding: EdgeInsets.only(bottom: 30),
                        alignment: Alignment.topLeft,
                        child: Text(
                          info,
                          style: TextStyle(
                              color: Colors.cyan[800],
                              fontSize: 15,
                              fontStyle: FontStyle.normal),
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class MyInfo {
  String name;
  String info;
  AssetImage image;
  MyInfo(this.name, this.info, this.image);
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

class DropDown extends StatefulWidget {
  DropDown({Key key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Divider(
          color: Colors.grey,
          height: 1,
        ),
      ),
      _button("Пополнить баланс", true),
      _button("Пополнить бонусом", false),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TranzaktionPage(),
          ));
        },
        child: Container(
          margin: EdgeInsets.only(top: 45),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Icon(
                Icons.history,
                color: Colors.white,
              ),
              margin: EdgeInsets.only(right: 5),
            ),
            Container(
                child: Text(
              "Последние транзакции",
              style: TextStyle(color: Colors.white),
            ))
          ]),
        ),
      )
    ]);
  }

  Widget _button(String label, bool isCheek) {
    return FlatButton(
        onPressed: null,
        child: Container(
          decoration: BoxDecoration(
              border:
                  isCheek ? null : Border.all(color: Colors.green, width: 1),
              color: isCheek ? Colors.green : Color.fromRGBO(46, 61, 77, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Text(
            "$label",
            style: TextStyle(color: isCheek ? Colors.white : Colors.white),
          ),
          alignment: Alignment.center,
        ));
  }
}
