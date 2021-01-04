import 'package:flutter/material.dart';
import 'package:globbing_app/domain/country.dart';

class CalculatePage extends StatefulWidget {
  CalculatePage({Key key}) : super(key: key);

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

int currentIndexD;
int currentIndexDelivery;

int currentIndexBody = 0;

var selectedtItemDelivery = 'Экспресс';
var selectedtItem = 'США';

bool bodyListWidget = true;
String typeDelivery = "Экспресс";
String typeCountry = "США";
String typeMoney = "1КГ/5000֏";

final List<bool> bodyList = [
  true,
  false,
  true,
  false,
  false,
  true,
  true,
];

List<Delivery> widgetDelivery = [
  Delivery("Экспресс", "5-10 раб. дней","1КГ/5000֏"),
  Delivery("Стандарт", "2,5 месяца","1КГ/1200֏,Mин.12000֏")
];

List _measures = [
  "кг",
  "фунт",
];

String _measure;

TextEditingController _controllerWight = TextEditingController();

TextEditingController _controllerKg = TextEditingController();
TextEditingController _controllerLong = TextEditingController();
TextEditingController _controllerHeight = TextEditingController();
TextEditingController _controllerWight1 = TextEditingController();
TextEditingController _controllerMetr = TextEditingController();

class _CalculatePageState extends State<CalculatePage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final String info = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("$info"),
      ),
      body: SingleChildScrollView(
              child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
             margin: EdgeInsets.only(left: 30, top: 20, bottom: 20),
             child: Text(
               "Выберите страну",
             )),
            Container(
           height: 85,
           child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: country.length,
               itemBuilder: (context, index) {
                 currentIndexD = index;
                 currentIndexBody = index;
                 return _country(country[index].name, country[index].image);
               }),
            ),
            Visibility(
             visible: bodyListWidget,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                     margin: EdgeInsets.only(left: 30, top: 36, bottom: 10),
                     child: Text("Метод доставки")),
                 Container(
                   height: 70,
                   margin: EdgeInsets.only(left: 20, right: 20),
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: widgetDelivery.length,
                     itemBuilder: (context, index) {
                       currentIndexDelivery = index;
                       return _delivery(widgetDelivery[index].name,
                           widgetDelivery[index].time);
                     },
                   ),
                 ),
               ],
             )),
            Container(
             child: Row(
           children: [
             _wight("Обший вес", _controllerWight, false),
             _dropCategory(),
             //_kg("hint", _controllerKg, false)
           ],
            )),
            Container(
           child: Column(
             children: [
               Container(
                 height: 1,
                 width: MediaQuery.of(context).size.width,
                 margin:
                     EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
                 child: ColoredBox(color: Colors.grey),
               ),
               Column(
                 children: [
                   _checkBox(),
                   Visibility(
                     visible: value,
                     child: Row(
                       children: [
                         _long("Длинна", _controllerLong, false),
                         _width("Ширина", _controllerWight1, false),
                         _height("Высота", _controllerHeight, false),
                         _metr("Еденица", _controllerMetr, false)
                       ],
                     ),
                   ),
                 ],
               )
             ],
           ),
            ),
            Spacer(),
            _listBuild(settings.length, settings),
          ]),
        ),
      ),
    );
  }

 Widget _dropCategory() {
    return Container(
      height: 42,
      width: 90,
      margin: EdgeInsets.only(left: 20,top:20),
      //decoration: BoxDecoration(border: Border.all(color: Colors.cyan[800],width: 1)),
      child: DropdownButtonFormField(

        //itemHeight: 10,
        isDense: true,
       style: TextStyle(fontSize: 15,color: Colors.white,),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10,top:10,right: 10,bottom: 10),
           enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan[800]),
                ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.green)),
          labelText: "Еденица измерения",
          labelStyle: TextStyle(color: Colors.cyan[800]),
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        value: _measure,
        onChanged: (value) {
          setState(() {
            _measure = value;
          });
        },
        items: _measures.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value,style: TextStyle(color: Colors.black),),
          );
        }).toList(),
      ),
    );
  }

  Widget _listBuild(int length, List<Info> info) {
   // int naem = currentIndex;
   String str = _controllerWight.text;
    return Container(
        decoration: BoxDecoration(
            color: Colors.green,
            boxShadow: [
              BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 5)
            ],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.only( left: 20, right: 20,bottom: 20),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.white, width: 0.3))),
            height: 50,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "$typeCountry $typeDelivery $typeMoney",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Стоимость доставки",
                      style: TextStyle(color: Colors.white),
                    )
                    ),
                    Spacer(),
                    Container(
                      width: 110,
                      margin: EdgeInsets.only(right:10),
                      child:Text("$str ",style: TextStyle(color: Colors.white,fontSize: 20),)
                    ),
                    Container(
                      //width: 130,
                      margin: EdgeInsets.only(right:10),
                      child:Text("֏",style: TextStyle(color: Colors.white,fontSize: 20),)
                    )
              ],
            ),
          )
        ]));
  }

  selectedItem(cardTitele) {
    setState(() {
      selectedtItem = cardTitele;
    });
  }

  Widget _country(String name, String image) {
    int index = currentIndexD;
    return InkWell(
      onTap: () {
        selectedItem(name);
        bodyListWidget = null;
        widgetDelivery = null;
        typeCountry = null;
        typeMoney = null;
        
        typeDelivery = "Экспресс";
       
        typeMoney= "1КГ/5000֏";
        
        typeCountry = country[index].name; 
        widgetDelivery = delivery[index];
        bodyListWidget = bodyList[index];
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
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
    int index = currentIndexDelivery;
    return InkWell(
      onTap: () {
        selectedItemDelivery(name);


        typeDelivery = null;
        typeMoney = null;

        typeMoney = widgetDelivery[index].money;
        typeDelivery = widgetDelivery[index].name;
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

  Widget _checkBox() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  this.value = !value;
                });
              },
              child: Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    //shape: BoxShape.circle, color: Colors.blue
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: value ? Colors.green : Colors.white,
                    border: Border.all(color: Colors.green)),
                child: Container(
                    child: Icon(
                  Icons.check,
                  size: 15.0,
                  color: Colors.white,
                )),
              ),
            ),
            Container(
                child: Text(
              "Крупногоборитные посылки",
              style: TextStyle(fontSize: 13),
            )),
            Spacer(),
            Container(
                child: Icon(
              Icons.help,
              color: Colors.orange,
              size: 30,
            ))
          ]),
    );
  }


  Widget _wight(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 200,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: TextField(
              // textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
                // hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _kg(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 90,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: TextField(
              // textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
                // hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _metr(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 90,
          margin: EdgeInsets.only(left: 5, top: 20),
          child: Container(
            child: TextField(
              // textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
                // hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _long(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 70,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Container(
            child: TextField(
              // textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
                // hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _width(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 70,
          margin: EdgeInsets.only(left: 5, top: 20),
          child: Container(
            child: TextField(
              // textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
                // hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _height(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Row(
      children: [
        Container(
          height: 42,
          width: 70,
          margin: EdgeInsets.only(left: 5, top: 20),
          child: Container(
            child: TextField(
              // textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                // hintStyle: TextStyle(
                //     fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
                // hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
              ),
            ),
          ),
        ),
      ],
    );
  }

}

// дней","1КГ/5000֏"),
//   Delivery("Стандарт", "2,5 месяца","1КГ/1200֏,Mин.12000֏")

List<List<Delivery>> delivery = [
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/5000֏"),
    Delivery("Стандарт", "2,5 месяца","1КГ/1200֏,Mин.12000֏"),
  ],
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/5000֏"),
    Delivery("Стандарт", "2,5 месяца","1КГ/5000֏"),
  ],
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/5500֏"),
    Delivery("Стандарт", "1,5 месяца","1КГ/2500֏"),
    Delivery( "Наземная","22 раб. дней","1КГ/700֏,Мин.700֏"),
  ],
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/5000֏"),
    Delivery("Стандарт", "2,5 месяца","1КГ/5000֏"),
  ],
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/4000֏"),
    Delivery("Стандарт", "2,5 месяца","1КГ/4000֏"),
  ],
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/5000֏"),
    Delivery("Наземная", "22 раб. дней","1КГ/2500֏"),
  ],
  [
    Delivery("Экспресс", "5-10 раб. дней","1КГ/2000֏"),
    Delivery("Стандарт", "5-10 месяца","1КГ/1000֏,Мин.,4000֏"),
  ],
];

class Delivery {
  String name;
  String time;
  String money;
  Delivery(this.name, this.time,this.money);
}


final List<Country> country = [
  Country("США", 0, "assets/usa.png", false, true),
  Country("Великобритания", 0, "assets/gb.png", false, false),
  Country("Китай", 0, "assets/china.png", false, true),
  Country("Германия", 0, "assets/german.png", false, true),
  Country("Италия", 0, "assets/italia.png", false, true),
  Country("Дубай", 0, "assets/dubai.png", false, true),
  Country("Россия", 0, "assets/rus.png", false, true),
];

class Info {
  String name;
  IconData icon;
  StatefulWidget widget;

  Info(this.name, this.icon);
}

List<Info> settings = [
  Info(
    "Настройки",
    Icons.settings_outlined,
  ),
  Info(
    "Помощь",
    Icons.help_outline,
  )
];
