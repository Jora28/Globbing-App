import 'package:flutter/material.dart';
import 'package:globbing_app/domain/country.dart';
import 'package:globbing_app/domain/delivery.dart';

class AddOrder extends StatefulWidget {
  AddOrder({Key key}) : super(key: key);

  @override
  _AddOrderState createState() => _AddOrderState();
}

int currentIndexBody = 0;
int currentIndex;
List<Widget> listContries = [];
bool bodyListWidget = true;

final List<bool> bodyList = [
  true,
  false,
  true,
  false,
  false,
  true,
  true,
];

List<Delivery> widgetDelivery=[
   Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца")

 ]; 

TextEditingController _controllerNumber = TextEditingController();

TextEditingController _controllerName = TextEditingController();

TextEditingController _controllerCount = TextEditingController();




class _AddOrderState extends State<AddOrder> {
  var selectedtItem = 'США';
  var selectedtItemDelivery = 'Экспресс';

  List<ListItem> _item = ListItem.getCompanies();
  List<DropdownMenuItem<ListItem>> _dropDownMenuItem;
  ListItem _selectItem;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItem = buildDropDownMenuItems(_item);
    _selectItem = _dropDownMenuItem[0].value;
  }

   List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List compan){
     List<DropdownMenuItem<ListItem>> items = List();
     for(ListItem item in compan){
       items.add(DropdownMenuItem(value: item,child:Text(item.logo),));
     }
     return items;
   }

   onChanche(ListItem selectItem){
     setState(() {
       _selectItem = selectItem;
     });
   }

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
                  currentIndexBody = index;
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
                "Ввести заказ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
            ],
          )),
    );
  }

  Widget _body() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.5,
      margin: EdgeInsets.only(top: size.height * 0.15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _number("Трек-номер", _controllerNumber, false),
            Visibility(
              child: _text(),
              visible: bodyListWidget,
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
            _name("Название", _controllerName, false),
            _count("Обшее количество", _controllerCount, false),
            
            _notification(),
            _button("Подтвержение", true)
          ],
        ),
      ),
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
        bodyListWidget = null;
        widgetDelivery = null;
        bodyListWidget = bodyList[index];
        widgetDelivery = delivery[index];
        
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

  Widget _number(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 42,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          obscureText: obscure,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
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
    );
  }

  Widget _text() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Text(
          "Выбраммый способ доставки или повторное подтвержение здесь будет считаться окончательным."),
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
                margin: EdgeInsets.only(left: 10,top:10),
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
                  color:
                      name == selectedtItemDelivery ? Colors.green : Colors.grey[200],
                ),
                margin: EdgeInsets.only(top: 14),
                width: 150,
                height: 3,
              )
            ],
          )),
    );
  }

  Widget _name(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 42,
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Container(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          obscureText: obscure,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
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
    );
  }

  Widget _count(
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
               textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: obscure,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: hint,
                suffix:Container(
              child:DropdownButton(
                items: _dropDownMenuItem, 
                onChanged: onChanche,
                value: _selectItem,
                )
            ), 
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
        
        _money()
      ],
    );
  }

  Widget _money() {
    int money = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5, right: 10, left: 10, top: 15),
          child: Text(
            "Сумма в драмах",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Container(
                child: Text("$money", style: TextStyle(fontSize: 12)),
              ),
              Container(
                child: Text(" AMD", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _notification() {
    return Container(
      margin: EdgeInsets.only(left: 20, ),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.help,
              color: Colors.orange,
            ),
          ),
          Container(
            width: 260,
            margin: EdgeInsets.only(left: 15,top:20),
            //decoration: BoxDecoration(color: Colors.red),
            child: Text(
              "Moжет возникнуть таможенная ответстшенность. Можете ознакомится с законом здесь.",
              style: TextStyle(fontSize: 12),
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(String label, bool isCheek) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 20),
      child: FlatButton(
          onPressed: null,
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
              style: TextStyle(color: isCheek ? Colors.white : Colors.white),
            ),
            alignment: Alignment.center,
          )),
    );
  }
}

class ListItem {
  int value;
  String logo;
  String name;

  ListItem(this.value, this.name, this.logo);
  static List<ListItem>  getCompanies() {
  return <ListItem>[ListItem(1, "AMD", "֏"),
  ListItem(2, "RUB", "₽"),
  ListItem(3, "EURO", "€"),
  ListItem(4, "GBP", "£"),
  ListItem(5, "USD", "\$"),
  ListItem(6, "Yuan", "¥")
  ];
}

}

List<List<Delivery>> delivery = [
  [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
   [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
    [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "1,5 месяца"),Delivery("Наземная", "22 раб. дней",),],
     [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
      [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
       [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Наземная", "22 раб. дней"),],
        [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "5-10 месяца"),],
];



final List<Country> country = [
  Country("США", 0, "assets/usa.png", false, true),
  Country("Великобритания", 0, "assets/gb.png", false, false),
  Country("Китай", 0, "assets/china.png", false, true),
  Country("Германия", 0, "assets/german.png", false, true),
  Country("Италия", 0, "assets/italia.png", false, true),
  Country("Дубай", 0, "assets/dubai.png", false, true),
  Country("Россия", 0, "assets/rus.png", false, true),
];
