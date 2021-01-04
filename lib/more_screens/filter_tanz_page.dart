import 'package:flutter/material.dart';

class FilterTranz extends StatefulWidget {
  FilterTranz({Key key}) : super(key: key);

  @override
  _FilterTranzState createState() => _FilterTranzState();
}

List _countries = [
  "Все",
  "In",
  "Out",
];
List _categories = [
  "Все",
  "Баланс",
  "Бонус",
];
String _coutry;
String _category;

class _FilterTranzState extends State<FilterTranz> {
  DateTime dateTime;
  DateTime dateTime1;

  @override
  void initState() {
    super.initState();

    dateTime = DateTime.now();
    dateTime1 = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(46, 61, 77, 1),
        appBar: _appBar(),
        body: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              children: [
                Text(
                  "Transaction type",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                    child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ))
              ],
            ),
          ),
          _dropCountry(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              children: [
                Text(
                  "По типу транзакции",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                    child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ))
              ],
            ),
          ),
         
          _dropCategory(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              children: [
                Text(
                  "По дате",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                    child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ))
              ],
            ),
          ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 _calendarS(),
                 _calendarP()
               ],
             ),
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30, top: 20, bottom: 40),
                child: Text(
                  "Сброс",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          Spacer(),
          _button("Применить", true)
        ]));
  }

  Widget _button(String label, bool isCheek) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
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
              style: TextStyle(
                  color: isCheek ? Colors.white : Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            alignment: Alignment.center,
          )),
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
                    "Фильтр",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }

  Widget _dropCountry() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
      child: DropdownButtonFormField(
        
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          errorStyle: TextStyle(color: Colors.white),
          labelText: "Transaction type",
          labelStyle: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        value: _coutry,
        onChanged: (value) {
          setState(() {
            _coutry = value;
          });
        },
        items: _countries.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _dropCategory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.green)),
          errorStyle: TextStyle(color: Colors.white),
          labelText: "По типу транзакции",
          labelStyle: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        value: _category,
        onChanged: (value) {
          setState(() {
            _category = value;
          });
        },
        items: _categories.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }



  Widget _calendarS() {
    return GestureDetector(
      onTap: _dateTapS,
          child: Container(
             margin: EdgeInsets.only(left:10),
            padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5),),
          border: Border.all(color: Colors.white,width: 1)

        ),
          child: Row(
            children: [
              Text("${dateTime.year}/${dateTime.month}/${dateTime.day}",style: TextStyle(color: Colors.white,fontSize: 15),),
              Container(
                margin: EdgeInsets.only(left:10),
                child: Icon(Icons.calendar_today_outlined,color: Colors.green))
            ],
          ),
          // trailing: Icon(Icons.keyboard_arrow_down,color:Colors.white),
          
        
      ),
    );
  }

  _dateTapS() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5));

        if(date != null){
        setState(() {
          dateTime = date;
        });
        }
  }
 
 
 Widget _calendarP() {
    return GestureDetector(
      onTap: _dateTapP,
          child: Container(
            margin: EdgeInsets.only(right:10),
            padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5),),
          border: Border.all(color: Colors.white,width: 1)

        ),
          child: Row(
            children: [
              Text("${dateTime1.year}/${dateTime1.month}/${dateTime1.day}",style: TextStyle(color: Colors.white,fontSize: 15),),
              Container(
                margin: EdgeInsets.only(left:10),
                child: Icon(Icons.calendar_today_outlined,color: Colors.green),)
            ],
          ),
          // trailing: Icon(Icons.keyboard_arrow_down,color:Colors.white),
          
        
      ),
    );
  }

  _dateTapP() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: dateTime1,
        firstDate: DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5));

        if(date != null){
        setState(() {
          dateTime1 = date;
        });
        }
  }

}
