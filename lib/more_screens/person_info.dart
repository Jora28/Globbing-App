import 'package:flutter/material.dart';

class PersonInfo extends StatefulWidget {
  PersonInfo({Key key}) : super(key: key);

  @override
  _PersonInfoState createState() => _PersonInfoState();
}

TextEditingController _controllerName = TextEditingController();
TextEditingController _controllerLastName = TextEditingController();
TextEditingController _controllerPhone = TextEditingController();
TextEditingController _controllerDate = TextEditingController();
TextEditingController _controllerSex = TextEditingController();

class _PersonInfoState extends State<PersonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(  
          child: Column(
            children: [
            _email(),
            _name("Имя", _controllerName, false),
            _lastName("Фамилия", _controllerLastName, false),
            _phone("Телефон", _controllerPhone, false),
            _date("Дата рождения", _controllerDate, false),
            _sex("Пол", _controllerSex, false),
            _password(),
            //Spacer(),
            _button("Сохранить")
          ]),
        ));
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
                    "Личные данне",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }

  Widget _email() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Text(
            "Эл. адресс",
            style: TextStyle(color: Colors.cyan[800]),
          )),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "mkrtchyan.jor28@gmail.com",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.help,
                  color: Colors.orange,
                  size: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _name(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
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

  Widget _lastName(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
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

  Widget _phone(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: TextField(
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.top,
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

  Widget _date(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
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

  Widget _sex(
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
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

  Widget _password() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 1)
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      child: ListTile(
        onTap: () {},
        title: Text("Изменить пороль"),
        leading: Icon(
          Icons.lock_outline,
          color: Colors.black,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _button(String label) {
    return Container(
      margin: EdgeInsets.only(top:120),
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
              style: TextStyle(color:Colors.white),
            ),
            alignment: Alignment.center,
          )),
    );
  }

}
