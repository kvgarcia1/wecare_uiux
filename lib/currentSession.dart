import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class CurrentSessionPage extends StatelessWidget {
  const CurrentSessionPage({Key? key}) : super(key: key);

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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF9F9F9),
        unselectedFontSize: 15,
        selectedFontSize: 15,
        selectedItemColor: Color(0xFF7B7B7B),
        unselectedItemColor: Color(0xFF7B7B7B),
        elevation: 0.0,
        
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.stop_circle_outlined),
        
        label: 'End',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.pause_circle_filled_outlined),
        label: 'Pause',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.play_circle_fill_outlined),
        label: 'Start',
      ),
    ],
      ),

      
      
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(


            children: [
              
        
              


              Align(
                alignment: Alignment.centerLeft,
                child: Text("Session Information", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("15 June 2023 | 10AM - 11AM", style: TextStyle(fontSize: 15, fontFamily: 'OpenSans',color: Color(0xFF7B7B7B))),
              ),

              const SizedBox(height: 30),


              Row(
                children: [
                  Container(
                    width:110,
                    alignment: Alignment.topCenter,
                            child: RichText(
                              textAlign: TextAlign.center,
                              
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Heart Rate", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "92", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "bpm", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                                  
                                ]
                              )
                            ),
                    

                  ),

                  Container(
                    width:110,

                    alignment: Alignment.topCenter,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Oxygen", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "91", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "%", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                                ]
                              )
                            ),

                  ),

                  Container(
                     width:110,

                    alignment: Alignment.topCenter,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Blood Pressure", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "170", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "mmHg", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                                  

                                
                                ]
                              )
                            ),

                  ),


                  
                ],


              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Container(
                    width:175,
                    alignment: Alignment.topCenter,
                            child: RichText(
                              textAlign: TextAlign.center,
                              
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Cadence", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "71", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "rpm", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                                  
                                ]
                              )
                            ),
                    

                  ),

                  Container(
                    width:175,

                    alignment: Alignment.topCenter,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Resistance", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "6", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 40)),
                                  TextSpan(text: "\n"),
                                  TextSpan(text: "units", style: TextStyle( fontFamily:'OpenSans', fontSize: 15)),
                                ]
                              )
                            ),

                  ),



                  
                ],
              ),

              const SizedBox(height: 20),

              Container(
                    height:200,
                    alignment: Alignment.topCenter,
                    color:Color(0xFFE7E9EC),
                    child: const Text(''),
                    ),

              const SizedBox(height: 20),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    width:110,
                    alignment: Alignment.topCenter,
                            child: ElevatedButton(
                        onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSessionPage()));
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE56AEFF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          
                          side: BorderSide.none,
                        ),
                        child: Text('Heart Rate', style: TextStyle(fontWeight: FontWeight.w700)),
                      )
                    

                  ),

                  Container(
                    width:100,

                    alignment: Alignment.topCenter,
                            child: ElevatedButton(
                        onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSessionPage()));
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE56AEFF),
                          foregroundColor: Colors.white,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Oxygen', style: TextStyle(fontWeight: FontWeight.w700)),
                      )

                  ),

                  Container(
                     width:140,

                    alignment: Alignment.topCenter,
                            child: ElevatedButton(
                        onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSessionPage()));
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE56AEFF),
                          foregroundColor: Colors.white,
                          side: BorderSide.none, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Blood Pressure', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                      )

                  ),


                  
                ],


              ),

              



              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    width:175,
                    alignment: Alignment.topCenter,
                            child: ElevatedButton(
                        onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSessionPage()));
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE56AEFF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          
                          side: BorderSide.none,
                        ),
                        child: Text('            Cadence           ', style: TextStyle(fontWeight: FontWeight.w700)),
                      )
                    

                  ),

                  Container(
                    width:175,

                    alignment: Alignment.topCenter,
                            child: ElevatedButton(
                        onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSessionPage()));
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE56AEFF),
                          foregroundColor: Colors.white,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('          Resistance          ', style: TextStyle(fontWeight: FontWeight.w700)),
                      )

                  ),

                ]
              ),

              const SizedBox(height: 20),

              


            

              
              
            ],
            
          ),
        ),

        

        // MENU

       




      ),
    );
  }
}