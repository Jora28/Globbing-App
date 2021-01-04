import 'package:flutter/material.dart';
import 'package:globbing_app/domain/delivery.dart';

class ForbiddenPage extends StatefulWidget {
  ForbiddenPage({Key key}) : super(key: key);

  @override
  _ForbiddenPageState createState() => _ForbiddenPageState();
}

class _ForbiddenPageState extends State<ForbiddenPage> {
  var selectedtItem = 'США';
  int currentIndex;
  int indexTap;
  var selectedtItemDelivery = 'Экспресс';
  TextEditingController _controller = TextEditingController();

  bool bodyListWidget = true;

 List<Delivery> widgetDelivery=[
   Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца")

 ]; 
//TextEditingController _controller = TextEditingController();

  final List<bool> bodyList = [
    true,
    false,
    true,
    false,
    false,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ColoredBox(
                  color: Color.fromRGBO(46, 61, 77, 1),
                )),
            Container(
              height: 85,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: country.length,
                itemBuilder: (context, index) {
                  currentIndex = index;
                  // currentIndexBody = index;
                  return _country(country[index].name, country[index].image);
                },
              ),
            ),
            _body()
          ],
        ),
      ),
    );
  }

  Widget _body() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Метод доставки"),
            ),
            Visibility(
              visible: bodyListWidget,
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widgetDelivery.length,
                  itemBuilder: (context, index) {
                    return _delivery(
                        widgetDelivery[index].name, 
                        widgetDelivery[index].time);
                  },
                ),
              ),
            ),
            _search(Icon(Icons.search), "Писк", _controller, false),
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Text("Запрешенные товары"),
            ),
            _forbiddenList(),
          ],
        ),
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
                "Запрешенные товары",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
            ],
          )),
    );
  }

  selectedItem(cardTitele) {
    setState(() {
      selectedtItem = cardTitele;
    });
  }

  Widget _country(String name, String image) {
    int index = currentIndex;
    return InkWell(
      onTap: () {
        selectedItem(name);
        widgetDelivery = null;
         widgetDelivery = delivery[index];
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            // border: Border(
            //   bottom: BorderSide(
            //     color:name == selectedtItem ? Colors.black: Colors.white,
            //     width: 1,
            //   ),
            // ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: name == selectedtItem ? Offset(0, 1) : Offset(0, 0),
                  color: Colors.grey,
                  blurRadius: 0)
            ],
            color: name == selectedtItem ? Colors.white : Colors.grey[200],
          ),
          width: 130,
          margin:
              EdgeInsets.only(left: index == 0 ? 25 : 10, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "$name",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color:
                      name == selectedtItem ? Colors.green : Colors.grey[200],
                ),
                margin: EdgeInsets.only(top: 12),
                width: 130,
                height: 3,
              )
            ],
          )),
    );
  }

  selectedItemDelivery(cardTitele) {
    setState(() {
      selectedtItemDelivery = cardTitele;
    });
  }

  Widget _delivery(String name, String time) {
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
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text("$name"),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "$time",
                  style: TextStyle(fontSize: 12),
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
                margin: EdgeInsets.only(top: 14),
                width: 150,
                height: 3,
              )
            ],
          )),
    );
  }

  Widget _search(
    Icon prefixIcon,
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 52,
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(49))),
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          controller: controller,
          obscureText: obscure,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              prefixIcon: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.black),
                  child: prefixIcon,
                ),
              )),
        ),
      ),
    );
  }

  Widget _forbiddenList() {
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listShops.length,
          itemBuilder: (context, i) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Wrap(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.grey,
                            blurRadius: 3)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 10, left: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              listShops[i].name,
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            )),
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, left: 15, bottom: 10),
                          child: Text(
                            listShops[i].description,
                            style: TextStyle(color: Colors.cyan[800]),
                            //textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ]));
          }),
    );
  }
}

class Forbiddens {
  String name;
  String description;

  Forbiddens(this.name, this.description);
}

List<Forbiddens> listShops = [
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Under Armour",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
  Forbiddens("Zara",
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров."),
];

class Country {
  String name;
  String image;
  int count;
  bool isClick;
  List<String> widgets;
  bool visibale;
  Country(this.name, this.count, this.image, this.isClick, this.visibale,
      this.widgets);
}
   final List<Country> country = [
      Country("США", 0, "assets/usa.png", false, true, [
        "Эксперт", "5-10 раб. дней",
        "Стандарт", "2,5 месяца"
      ]),
      Country("Великобритания", 0, "assets/gb.png", false, false, [
        "Эксперт", "5-10 раб. дней",
"Стандарт", "2,5 месяца",
      ]),
      Country("Китай", 0, "assets/china.png", false, true, [
        "Эксперт", "5-10 раб. дней",
        "Наземная", "22 раб. дней",
        "Стандарт","1,5 месяца"
      ]),
      Country("Германия", 0, "assets/german.png", false, true, [
        "Эксперт", "5-10 раб. дней",
        "Стандарт", "2,5 месяца"
      ]),
      Country("Италия", 0, "assets/italia.png", false, true, [
        "Эксперт", "5-10 раб. дней",
        "Стандарт", "2,5 месяца"
      ]),
      Country("Дубай", 0, "assets/dubai.png", false, true, [
        "Эксперт", "5-10 раб. дней",
        "Наземная", "22 раб. дней"
      ]),
      Country("Россия", 0, "assets/rus.png", false, true, [
        "Эксперт", "5-10 раб. дней",
        "Стандарт", "5-10 месяца"
      ]),
    ];

List<List<Delivery>> delivery = [
  [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
   [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
    [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "1,5 месяца"),Delivery("Наземная", "22 раб. дней",),],
     [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
      [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
       [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Наземная", "22 раб. дней"),],
        [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "5-10 месяца"),],
];


