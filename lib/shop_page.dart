import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globbing_app/domain/shop.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final Shops shops = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: _appBar(),
      body: _body(shops.image, shops.name, shops.rating, shops.count,
          shops.description, shops.country),
    );
  }

  Widget _body(
    String image,
    String name,
    double rating,
    int count,
    String description,
    String country,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(children: [
              Container(
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                    image: DecorationImage(image: AssetImage(image)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.grey,
                          blurRadius: 2)
                    ]),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(name),
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                    ),
                    Container(
                      child: Text("Страна"),
                    ),
                    Container(
                      child: Text(
                        country,
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Раздел"),
                ),
                Container(
                  child: Text(
                    "Обший",
                    style: TextStyle(color: Colors.cyan[800]),
                  ),
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                child: Text("Описание"),
              ),
              Container(
                child: Text(
                  description,
                  style: TextStyle(color: Colors.cyan[800]),
                ),
                margin: EdgeInsets.only(
                  top: 10,
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Перейти в магазин",
              style: TextStyle(
                color: Colors.green,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Рейтинг"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      itemSize: 30,
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "$rating",
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                    ),
                    Container(
                      child: Text(
                        "($count" ')',
                        style: TextStyle(color: Colors.cyan[800]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Добавить оценку"),
                ),
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
                    "Как пользоваться",
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
