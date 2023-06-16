import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: const Text('WeCaRE'),
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/AppLogo.png'
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){},
            )
          ],
          backgroundColor: Color(0xFFF9F9F9),
          foregroundColor: Color(0xFF7B7B7B),
          scrolledUnderElevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("     How are you feeling \n     today?", style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),
              ),
              const SizedBox(height: 50),

              Row(
                children: [


                  Container(
                  alignment: Alignment.topCenter,
                  width:25),

                




                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/emo1.png', height: 100,)

                  
                
                ),

                Container(
                  alignment: Alignment.topCenter,
                  width:10),

                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/emo2.png', height:100,)
                ),

                Container(
                  alignment: Alignment.topCenter,
                  width:10),

                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/emo3.png', height: 100,)
                ),
                
                ],
                ),

                const SizedBox(height: 30),


               Container(
                  child: Stack(
                  children: <Widget>[

                    



                  Container(
                    height: 480,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color(0xFFA0D9F6),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))
                    ),

                    alignment: Alignment.center, // where to position the child
                    child: Container(
                      width: 260.0,
                      height: 250.0,
                      color: Colors.white,
                    ),

                  ),

                  Container(
                      child:Text("\n     Add your entry here:",style: TextStyle(fontFamily: 'ProximaNova', fontSize: 28,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),



                    ),


                  Container(

                    height:430, 
                    width:310,
                    alignment: Alignment.bottomRight,
                    child:
                    IconButton(
                      iconSize: 40,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                    
                  

                    ),
              

                ],

              ),
              ),

             
              
            ],
            
          ),
        ),

        

        // MENU

       




      ),
    );
  }
}