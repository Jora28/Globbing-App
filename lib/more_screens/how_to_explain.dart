import 'package:flutter/material.dart';

class HowToDo extends StatefulWidget {
  HowToDo({Key key}) : super(key: key);

  @override
  _HowToDoState createState() => _HowToDoState();
}

class _HowToDoState extends State<HowToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
          body: Container(
        margin: EdgeInsets.symmetric(vertical:20,horizontal:20),
        child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(child:Text("Как это работает.")),
               Container(
                 margin: EdgeInsets.symmetric(vertical:20),
               child: Text("95% международных интернет-магазинов не доставляют в Армению. В редких случаях стоимость доставки очень высока, а сроки доставки очень длинные. Глоббинг - это международная платформа для онлайн-шоппинга, которая позволяет вам воспользоваться всеми преимуществами онлайн-шопинга, при совершении покупок в 7 странах: США, Англии, Германии, Китае, Дубае, Италии и России."),
               ),
                Container(child:Text("1. Зарегистрируйтесь и получите свой адрес доставки.")),
               Container(
                 margin: EdgeInsets.symmetric(vertical:20),
               child: Text("95% международных интернет-магазинов не доставляют в Армению. В редких случаях стоимость доставки очень высока, а сроки доставки очень длинные. Глоббинг - это международная платформа для онлайн-шоппинга, которая позволяет вам воспользоваться всеми преимуществами онлайн-шопинга, при совершении покупок в 7 странах: США, Англии, Германии, Китае, Дубае, Италии и России."),
               ),
               Container(child:Text("2. Покупйте онлаийн и использоуйте свойадресдоставки.")),
               Container(
                 margin: EdgeInsets.symmetric(vertical:20),
               child: Text("95% международных интернет-магазинов не доставляют в Армению. В редких случаях стоимость доставки очень высока, а сроки доставки очень длинные. Глоббинг - это международная платформа для онлайн-шоппинга, которая позволяет вам воспользоваться всеми преимуществами онлайн-шопинга, при совершении покупок в 7 странах: США, Англии, Германии, Китае, Дубае, Италии и России."),
               ),Container(child:Text("3. Получите свою посылку быстро и безопасно.")),
               Container(
                 margin: EdgeInsets.symmetric(vertical:20),
               child: Text("95% международных интернет-магазинов не доставляют в Армению. В редких случаях стоимость доставки очень высока, а сроки доставки очень длинные. Глоббинг - это международная платформа для онлайн-шоппинга, которая позволяет вам воспользоваться всеми преимуществами онлайн-шопинга, при совершении покупок в 7 странах: США, Англии, Германии, Китае, Дубае, Италии и России."),
               ),
             ],
          ),
        ),
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