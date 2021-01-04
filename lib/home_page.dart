import 'package:flutter/material.dart';
import 'package:globbing_app/add_order.dart';

import 'main_page.dart';
import 'more_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //bottomNavigationBar: _bottomBar(),
       body: _body(),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:_bottomBar(), 
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.orange,
         foregroundColor: Colors.white,
         child: Icon(Icons.add),
         onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddOrder()));
         },

   ),
    );
  }

  final iconList = <IconData>[
    Icons.home,
    Icons.menu,
  ];

 Widget _bottomBar(){
        return BottomNavigationBar(
            currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Основной',),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Ввести заказ"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Более')
        ]);
 }

 Widget _body(){
   switch(_currentIndex){
     case 0:
     return MainPage();
     case 2:
     return MorePage();

     default:
     return MainPage();

   }
 }

}
