import 'package:flutter/material.dart';
import './models/chatMessageModel.dart';

class ChatDetailPage extends StatefulWidget{
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF9F9F9),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Color(0xFF7B7B7B),),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  maxRadius: 20,
                  backgroundImage: AssetImage('assets/images/userImage1.jpg'),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Jane Russel",style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.w600, fontFamily: 'ProximaNova', color: Color(0xFF7B7B7B))),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Color(0xFF7B7B7B), fontSize: 13)),
                    ],
                  ),
                ),
                Icon(Icons.settings,color: Color(0xFF7B7B7B)),
              ],
            ),
          ),
        ),
      ),
      // Bottom Text Box
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver"?Color(0xFFE7E9EC):Color(0xFFA0D9F6)),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Color(0xFFF9F9F9),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFA0D9F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Color(0xFFF9F9F9), size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Color(0xFF37393C)),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: Color(0xFFA0D9F6),
                    elevation: 0,
                    child: Icon(Icons.send,color: Color(0xFFF9F9F9),size: 18,),
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}