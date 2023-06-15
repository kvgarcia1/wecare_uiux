import 'package:flutter/material.dart';
// import '../../sessionDetailPage.dart';


class SessionList extends StatefulWidget{
  final String number;
  final String day;
  final String date;
  final String time;
  SessionList({required this.number,required this.day,required this.date,required this.time});
  @override
  State<SessionList> createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Text(widget.number, style: TextStyle(fontFamily: 'ProximaNova')),
            title: Text(widget.date, style: TextStyle(fontFamily: 'ProximaNova')),
            subtitle: Text(widget.time, style: TextStyle(fontFamily: 'ProximaNova')),
            onTap: (){}
          ),
        ],
      )
    );
  }
}

// class MyVerticalText extends StatelessWidget {
//   final String day;

//   const MyVerticalText(this.day);

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       runSpacing: 30,
//       direction: Axis.vertical,
//       alignment: WrapAlignment.center,
//       children: day.split("").map((string) => Text(string, style: TextStyle(fontSize: 22))).toList(),
//     );
//   }
// }