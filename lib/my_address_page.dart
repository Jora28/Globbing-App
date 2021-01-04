import 'package:flutter/material.dart';
import 'package:globbing_app/domain/country.dart';
import 'package:globbing_app/domain/delivery.dart';
import 'package:globbing_app/your_adress_in.dart';

class MyAddressPage extends StatefulWidget {
  MyAddressPage({Key key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
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




List<List<Delivery>> delivery = [
  [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
   [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
    [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "1,5 месяца"),Delivery("Наземная", "22 раб. дней",),],
     [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
      [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "2,5 месяца"),],
       [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Наземная", "22 раб. дней"),],
        [Delivery("Экспресс", "5-10 раб. дней"),Delivery("Стандарт", "5-10 месяца"),],
];


class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои заказы"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
          itemCount: country.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => YourAdress(),
                  settings:  RouteSettings(arguments:  delivery[index])
                ));
              },
              child: Container(
                  height: 66,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 1),
                          color: Colors.grey)
                    ],
                  ),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                                image: AssetImage(country[index].image),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                            child: Text(
                          country[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )),
                        Spacer(),
                      ])),
            );
          }),
    );
  }
}
