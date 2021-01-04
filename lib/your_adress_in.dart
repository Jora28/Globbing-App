import 'package:flutter/material.dart';

import 'package:globbing_app/domain/delivery.dart';

import 'package:globbing_app/more_screens/forbidden_page.dart';

class YourAdress extends StatefulWidget {
  YourAdress({Key key}) : super(key: key);

  @override
  _YourAdressState createState() => _YourAdressState();
}

var selectedtItemDelivery = 'Экспресс';
int current;
class _YourAdressState extends State<YourAdress> {
  @override
  Widget build(BuildContext context) {
    List<String> info = [
      "Jora Mkrtchyan",
      "950 Ridge RD C25",
      "A223575",
      "DE",
      "Claymont",
      "19789",
      "USA",
      "+1 302 4125267"
    ];
    List<String> constant = [
      "Name",
      "Address",
      "Address line 2",
      "State",
      "City",
      "Postal Code",
      "Country",
      "Phone"
    ];
    
    final List<Delivery> country = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ColoredBox(
                    color: Color.fromRGBO(46, 61, 77, 1),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 85,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                 physics: NeverScrollableScrollPhysics(),
                  itemCount: country.length,
                  itemBuilder: (context, index) {
                    current = index;
                    return _delivery(country[index].name, country[index].name,country.length.toDouble());
                  },
                ),
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _listBuild(constant.length, constant, info),
              Container(
                  margin: EdgeInsets.only(right: 30, top: 20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      "copy all",
                      style: TextStyle(color: Colors.green),
                    ),
                  )),
              _button(),
              
            ],
          ))),
          _bottomContainer()
        ],
      ),
    );
  }

  Widget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 30),
          decoration: BoxDecoration(color: Color.fromRGBO(46, 61, 77, 1)),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 15),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                "Ваш адрес",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
            ],
          )),
    );
  }

  selectedItemDelivery(cardTitele) {
    setState(() {
      selectedtItemDelivery = cardTitele;
    });
  }

  Widget _delivery(String name, String time,double size) {
    List<Icon> icon =[ Icon(Icons.airplanemode_active),Icon(Icons.airport_shuttle),Icon(Icons.airport_shuttle),];
    double d;
    int i = current;
    if(size == 3){
      d = 3.3;
    }else{
      d = 2.1;
    }
    return InkWell(
      onTap: () {
        selectedItemDelivery(name);
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: name == selectedtItemDelivery
                      ? Offset(0, 1)
                      : Offset(0, 0),
                  color: Colors.grey,
                  blurRadius: 0)
            ],
            color:
                name == selectedtItemDelivery ? Colors.white : Colors.grey[200],
          ),
          width: MediaQuery.of(context).size.width / d,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: icon[i],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "$time",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color: name == selectedtItemDelivery
                      ? Colors.green
                      : Colors.grey[200],
                ),
                margin: EdgeInsets.only(top: 11),
                width: MediaQuery.of(context).size.width,
                height: 3,
              )
            ],
          )),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>ForbiddenPage(),
                    
                          ));
                },
          child: Container(
        
          margin: EdgeInsets.only(top:60,left: 20, right: 20,bottom: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 1)
              ]),
          child: Row(children: [
            Container(
              child: Icon(Icons.work_off_outlined, color: Colors.black),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            Container(
              child: Text("Запрешенные товары"),
            ),
            Spacer(),
            Container(child: Icon(Icons.keyboard_arrow_right))
          ])),
    );
  }

  Widget _listBuild(int length, List<String> custom, List<String> info) {
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
                
                child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: i == 0 ? Colors.grey : Colors.white,
                          width: 0.5))),
              child: Container(
                height: 50,
                margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          "${custom[i]}",
                          style: TextStyle(color: Colors.cyan[800]),
                        )),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("${info[i]}")),
                      ],
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            "copy",
                            style: TextStyle(color: Colors.green),
                          ),
                        ))
                  ],
                ),
              ),
            ));
          }),
    );
  }

  Widget _bottomContainer() {
    return Container(
      
      height: 80,
      decoration: BoxDecoration(color: Color.fromRGBO(46, 61, 77, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal:20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right:5),
                child: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
              Container(
                child: Text("ВАЖНО ЗНАТЬ",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal:20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right:5),
                child: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
              Container(
                width: 100,
                child: Text("КАК ИСПОЛЬЗОВАТЬ АДРЕСС",style: TextStyle(color: Colors.white),overflow: TextOverflow.clip,),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class InfoAdress {
  String name;

  String address1;
  String addressLine1;

  String state1;

  String city1;

  String postalCode2;

  String country1;

  String phone1;
  InfoAdress(this.name, this.address1, this.addressLine1, this.state1,
      this.city1, this.postalCode2, this.country1, this.phone1);
}
