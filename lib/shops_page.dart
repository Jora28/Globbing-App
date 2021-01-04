import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globbing_app/domain/shop.dart';
import 'package:globbing_app/shop_page.dart';

import 'more_screens/filter_page.dart';

class ShopsPage extends StatefulWidget {
  ShopsPage({Key key}) : super(key: key);

  @override
  _ShopsPageState createState() => _ShopsPageState();
}

List<Shops> listShops = [
  Shops("assets/zara.jpg", "Zara", 2.0, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Германия"),
  Shops("assets/under_armour.jpg", "Under Armour", 5, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","США"),
  Shops("assets/nike.jpg", "Zara", 3.0, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Австрия"),
  Shops("assets/martens.jpg", "Zara", 5.0, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Австрия"),
  Shops("assets/guess.jpg", "Zara",2.5, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Италия"),
  Shops("assets/fila.jpeg", "Zara", 1.5, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Австрия"),
  Shops("assets/ca.jpg", "Zara", 4.5, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Испания"),
  Shops("assets/boss.jpg", "Zara", 5, 22,
      "Самая популярная в мире испанская марка одежды, обуви и аксессуаров.","Австрия"),
];

class _ShopsPageState extends State<ShopsPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {        
    //final Shops shops = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FilterPage()));
          },
        ),
      appBar: AppBar(
        title: Text("Магазины"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        _search(Icon(Icons.search), Icon(Icons.close), "Поиск магазина",
            _controller, false),
        _text(),
        _shopList()
      ],
    );
  }
}

Widget _search(
  Icon prefixIcon,
  Icon suffix,
  String hint,
  TextEditingController controller,
  bool obscure,
) {
  return Container(
    height: 52,
    margin: EdgeInsets.only(top: 53),
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        obscureText: obscure,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan[800], width: 1)),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clear();
              },
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.black),
                  child: suffix,
                ),
              ),
            ),
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

Widget _text() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
    child: Text("Все"),
  );
}

Widget _shopList() {
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listShops.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShopPage(),
                  settings: RouteSettings(arguments: listShops[i])));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Wrap(
                  children:[ Container(
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
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(2),
                          //child: Image.network(dataList[i].imageUrl,fit: BoxFit.fill,),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.3),
                              image: DecorationImage(
                                  image: AssetImage(listShops[i].image),
                                  fit: BoxFit.contain)),
                        ),
                        Container(
                            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            alignment: Alignment.center,
                            child: Text(
                              listShops[i].name,
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                itemSize: 18,
                                initialRating: listShops[i].rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Container( 
                                child: Text(
                                  "(${listShops[i].count}"')',
                                  style: TextStyle(color: Colors.cyan[800]),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                          child:Text(listShops[i].description,style: TextStyle(color: Colors.cyan[800]),textAlign: TextAlign.center,) ,
                          )
                      ],
                    ),
                  ),
                  ]
                )),
          );
        }),
  );
}


