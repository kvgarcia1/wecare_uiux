import 'package:flutter/material.dart';
import 'package:wecare_uiux/sessionDetailPage.dart';
// import './widgets/sessionList.dart';

class SessionDates{
  String number;
  String day;
  String date;
  String time;
  SessionDates({required this.number,required this.day,required this.date,required this.time});
}

class SessionPage extends StatefulWidget {
  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  List<SessionDates> sessionDates = [
    SessionDates(number: "1", day: "THU", date: "June 8", time: "2:30 PM"),
    SessionDates(number: "2", day: "SAT", date: "June 10", time: "10:00 AM"),
    SessionDates(number: "3", day: "MON", date: "June 12", time: "1:00 PM"),
  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Color(0xFF7B7B7B)),
                  prefixIcon: Icon(Icons.search,color: Color(0xFF7B7B7B), size: 20,),
                  filled: true,
                  fillColor: Color(0xFFE7E9EC),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color(0xFFE7E9EC)
                      )
                  ),
                ),
              ),
            ),
            ListView.separated(
              itemCount: sessionDates.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ListTile(
                  visualDensity: VisualDensity(vertical: 4),
                  leading: Text(sessionDates[index].number, style: TextStyle(fontFamily: 'ProximaNova', fontWeight: FontWeight.w600, fontSize: 25)),
                  title: Text(sessionDates[index].date, style: TextStyle(fontFamily: 'ProximaNova', fontWeight: FontWeight.w700, fontSize: 18)),
                  subtitle: Text(sessionDates[index].time, style: TextStyle(fontFamily: 'ProximaNova', fontSize: 16)),
                  tileColor: Colors.white,
                  textColor: Color(0xFF7B7B7B),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return SessionDetailPage();
                  }));
                  }
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Color(0xFFF9F9F9));
              }
            ),
          ],
        ),
      ),
    );
  }
}