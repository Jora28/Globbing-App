import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

List _countries = [
  "Все",
  "Великобритания",
  "Германия",
  "Дубай",
  "Италия",
  "Китай",
  "Россия",
  "США",
];
List _categories = [
  "Онлайн Молл",
  "Одежда,оубвь и аксессуары",
  "Здаровье и красота",
  "Украшения и подарки",
  "Электроника и аксессуары",
  "Дом и сад",
  "Концелярские товары",
  "Досуг",
  "Спорт",
];
String _coutry;
String _category;

class _FilterPageState extends State<FilterPage> {
  bool value = false;
  bool switchVal = false;
  bool switchVal2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 61, 77, 1),
      appBar: _appBar(),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              Text(
                "Страны",
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                  child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ))
            ],
          ),
        ),
        _dropCountry(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              Text(
                "Категории",
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                  child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ))
            ],
          ),
        ),
        _dropCategory(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              Text(
                "По рейтингу",
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
                  child: Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ))
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              _checkBox(5, "5", value),
              _checkBox(4, "и высше", value),
              _checkBox(3, "и высше", value),
              _checkBox(2, "и высше", value),
              _checkBox(1, "и высше", value),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
        _switch("Кэшбэк"),
        _switch2("Купите вместо меня"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 30, top: 20, bottom: 40),
              child: Text(
                "Сбросисть",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        _button("Применить", true)
      ]),
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
                    "Фильтровать",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }

  Widget _dropCountry() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          errorStyle: TextStyle(color: Colors.white),
          labelText: "Страны",
          labelStyle: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        value: _coutry,
        onChanged: (value) {
          setState(() {
            _coutry = value;
          });
        },
        items: _countries.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _dropCategory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.green)),
          errorStyle: TextStyle(color: Colors.white),
          labelText: "Категирии",
          labelStyle: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        value: _category,
        onChanged: (value) {
          setState(() {
            _category = value;
          });
        },
        items: _categories.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _button(String label, bool isCheek) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
              border:
                  isCheek ? null : Border.all(color: Colors.green, width: 1),
              color: isCheek ? Colors.green : Color.fromRGBO(46, 61, 77, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(
            "$label",
            style: TextStyle(
                color: isCheek ? Colors.white : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
          alignment: Alignment.center,
        ));
  }

  Widget _switch(String str) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "$str",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            child: Switch(
              value: switchVal,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  switchVal = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _switch2(String str) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "$str",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            child: Switch(
              value: switchVal2,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  switchVal2 = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _checkBox(int count, String str, bool val) {
    String s = '';
    return Container(
      height: 30,
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: count,
                  itemBuilder: (context, index) {
                    if (index == count - 1) {
                      s = str;
                    }
                    return Row(
                      children: [
                        Container(
                          child: Icon(Icons.star, color: Colors.orange),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "$s",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  this.value = !val;
                });
              },
              child: Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    //shape: BoxShape.circle, color: Colors.blue
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: val ? Colors.green : Color.fromRGBO(46, 61, 77, 1),
                    border: Border.all(color: Colors.green)),
                child: Container(
                    child: Icon(
                  Icons.check,
                  size: 15.0,
                  color: val ? Colors.white : Color.fromRGBO(46, 61, 77, 1),
                )),
              ),
            ),
          ]),
    );
  }
}
