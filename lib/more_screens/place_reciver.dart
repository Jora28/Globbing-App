import 'package:flutter/material.dart';

class PlaceReciverPage extends StatefulWidget {
  PlaceReciverPage({Key key}) : super(key: key);

  @override
  _PlaceReciverPageState createState() => _PlaceReciverPageState();
}

class _PlaceReciverPageState extends State<PlaceReciverPage> {
  var selectedtItem = 'США';
  @override
  Widget build(BuildContext context) {
    //final String info = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: ListView(
                shrinkWrap: true,
                children: [
                Container(
                  child: Text(
                    "Ереван",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(left: 25, top: 35, bottom: 5),
                ),
                _country(placeE),
                Container(
                  child: Text(
                    "G - Truck",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(left: 25, top: 35, bottom: 5),
                ),
                _country(placeG),
                Container(
                  child: Text(
                    "Районы",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(left: 25, top: 35, bottom: 5),
                ),
                _country(placeR),
              ]),
            ),
            
            _button("Подтвердить")
          ],
        ));
  }

  Widget _button(String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: FlatButton(
          onPressed: null,
          child: Container(
            decoration: BoxDecoration(
      
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Text(
              "$label",
              style: TextStyle(color: Colors.white),
            ),
            alignment: Alignment.center,
          )),
    );
  }

  selectedItem(cardTitele) {
    setState(() {
      selectedtItem = cardTitele;
    });
  }

  Widget _country(List<Place> place) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: placeE.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedItem(place[index].name);
            },
            child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        offset: place[index].name == selectedtItem
                            ? Offset(0, 1)
                            : Offset(0, 0),
                        color: Colors.grey,
                        blurRadius: 0)
                  ],
                  color: place[index].name == selectedtItem
                      ? Colors.white
                      : Colors.grey[200],
                ),
                height: 50,
                width: 130,
                margin:
                    EdgeInsets.only(left: 20, top: 5, bottom: 10, right: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: place[index].name == selectedtItem
                          ? BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                  image: DecorationImage(image: AssetImage("assets/check.png")),
                              color: Colors.green,
                            )
                          : null,
                      child: Icon(
                        Icons.storefront,
                        size: 30,
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "${place[index].name}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "${place[index].address}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        });
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
                    "Основное место получателя",
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

List<Place> placeE = [
  Place("Арабкир", "Гр.Кочар 44/53"),
  Place("Кентрон", "Гр.Кочар 44/53"),
  Place("Ачапняк", "Гр.Кочар 44/53"),
  Place("Малатия", "Гр.Кочар 44/53"),
];
List<Place> placeG = [
  Place("Айгестан", "Гр.Кочар 44/53"),
  Place("Гнуни", "Гр.Кочар 44/53"),
  Place("Кохбаци", "Гр.Кочар 44/53"),
  Place("Малибу", "Гр.Кочар 44/53"),
];
List<Place> placeR = [
  Place("Гюмри", "Гр.Кочар 44/53"),
  Place("Севан", "Гр.Кочар 44/53"),
  Place("Эчмиадзин", "Гр.Кочар 44/53"),
  Place("Раздан", "Гр.Кочар 44/53"),
];

class Place {
  String name;
  String address;
  Place(this.name, this.address);
}
