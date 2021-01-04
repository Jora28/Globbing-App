import 'package:flutter/material.dart';
import 'package:globbing_app/more_screens/not/all.dart';
import 'package:globbing_app/more_screens/not/no_view.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            actions: [
              InkWell(
                onTap: (){
                  showDialog(context: context,builder: (context){
                    return AlertDialog(
                      content: Text("Вы уверены что хотите отметить все уведомления как прочитанные?"),
                      actions: [
                          _button("Подтвердить", true)
                      ],
                    );
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                child: Icon(Icons.mail)))
            ],
            title: Text("Уведомления"),
            bottom: TabBar(
              tabs: [Tab(text: "Не прочитано"), Tab(text: "Все")],
            )),
        body: TabBarView(children: [NoView(), All()]),
      ),
    );
  }

  Widget _button(String label, bool isCheek) {
    return FlatButton(
        onPressed: null,
        child: Container(
          decoration: BoxDecoration(
              border:
                  isCheek ? null : Border.all(color: Colors.green, width: 1),
              color: isCheek ? Colors.green : Color.fromRGBO(46, 61, 77, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Text(
            "$label",
            style: TextStyle(color: isCheek ? Colors.white : Colors.white),
          ),
          alignment: Alignment.center,
        ));
  }
}
