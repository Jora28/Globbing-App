import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  MyOrderPage({Key key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}
final List<OrderType> orderType = [
  OrderType("Введено",0,"assets/icon_tab.jpg"),
  OrderType("На складе",0,"assets/icon_home.jpg"),
  OrderType("В пути",0,"assets/icon_air.jpg"),
  OrderType("В Армении",0,"assets/icon_loc.jpg"),
  OrderType("Получено",0,"assets/icon_gift.jpg"),
];

class OrderType {
  String name;
  String image;
  int count;
  OrderType(this.name,this.count,this.image);
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Мои заказы"),
       ),
       body: _body(),
    );
  }
  Widget _body(){
    return Container(
      margin: EdgeInsets.only(top:30),
      child: ListView.builder(
        itemCount: orderType.length,
        itemBuilder: (context,index){
          return Container(
            height: 66,
            margin: EdgeInsets.only(left: 20,right: 20,bottom: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.all(Radius.circular(5)),
               boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0, offset: Offset(0, 1), color: Colors.grey)
                ],
              ),
            child:Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal:5),
                  width: 55,
                  height: 55,
                  child:Image.asset(orderType[index].image)
                   ),
                Container(child:Text(orderType[index].name)),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right:20),
                  child: Text("${orderType[index].count}"),),
              ],
            ) ,
            );
        }
        ),
    );
  }
}