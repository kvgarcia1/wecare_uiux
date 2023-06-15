import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import './generator.dart';
import './profile.dart';
// import './dashboard.dart';
import './session.dart';
import './messages.dart';
import './currentSession.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'WeCaRE',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF9F9F9)),
          scaffoldBackgroundColor: Color(0xFFF9F9F9),
          fontFamily: 'ProximaNova',
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _pages = <Widget>[
  HomePage(),
  ProfilePage(),
  GeneratorPage(),
  SessionPage(),
  MessagesPage(),
];

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
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Color(0xFFF9F9F9),
        selectedItemColor: Color(0xFF56AEFF),
        unselectedItemColor: Color(0xFF7B7B7B),
        selectedFontSize: 16,
        unselectedFontSize: 14,
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/AppLogo.png', height: 20,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.stethoscope),
            label: "Session",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "Messages",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/home.png',
                // height: 150.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(20.0),
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  // boxShadow: [BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 1,
                  //   blurRadius: 7,
                  //   offset: Offset(0, 2),
                  // )],
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      height: 150,
                      child: Image.asset('assets/images/session.png'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.topLeft,
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xFF7B7B7B),
                            fontFamily: 'ProximaNova'
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Upcoming Session", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.w800, fontSize: 17)),
                            TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                            TextSpan(text: "No upcoming session. Contact your designated physician to book a session schedule.",  style: TextStyle(fontFamily: 'OpenSans', fontSize: 13)),
                          ]
                        )
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      // padding: const EdgeInsets.only(left: 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSessionPage()));
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF0000),
                          foregroundColor: Colors.white,
                          side: BorderSide.none, shape: const StadiumBorder(),
                        ),
                        child: Text(' Start ', style: TextStyle(fontWeight: FontWeight.w700)),
                      )
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(20.0),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        // boxShadow: [BoxShadow(
                        //   color: Colors.grey.withOpacity(0.5),
                        //   spreadRadius: 1,
                        //   blurRadius: 7,
                        //   offset: Offset(0, 2),
                        // )],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 180,
                            child: Image.asset('assets/images/bluetooth.png'),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Connectivity", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.w800, fontSize: 17)),
                                  TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                                  TextSpan(text: "Device is connected.",  style: TextStyle(fontFamily: 'OpenSans', fontSize: 13)),
                                ]
                              )
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('1');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE7E9EC),
                                foregroundColor: Color(0xFF7B7B7B),
                                side: BorderSide.none, shape: const StadiumBorder(),
                              ),
                              child: Text('Connect', style: TextStyle(fontWeight: FontWeight.w700)),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(20.0),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        // boxShadow: [BoxShadow(
                        //   color: Colors.grey.withOpacity(0.5),
                        //   spreadRadius: 1,
                        //   blurRadius: 7,
                        //   offset: Offset(0, 2),
                        // )],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 180,
                            child: Image.asset('assets/images/journal.png'),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF7B7B7B),
                                  fontFamily: 'ProximaNova'
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Journal", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.w800, fontSize: 17)),
                                  TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                                  TextSpan(text: "You have not written a journal entry yet.",  style: TextStyle(fontFamily: 'OpenSans', fontSize: 13)),
                                ]
                              )
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => GeneratorPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF0000),
                                foregroundColor: Colors.white,
                                side: BorderSide.none, shape: const StadiumBorder(),
                              ),
                              child: Text('New Entry', style: TextStyle(fontWeight: FontWeight.w700)),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ]
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(20.0),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  // boxShadow: [BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 1,
                  //   blurRadius: 7,
                  //   offset: Offset(0, 2),
                  // )],
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomRight,
                      height: 300,
                      child: Image.asset('assets/images/calendar.png', height: 200,),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xFF7B7B7B),
                            fontFamily: 'ProximaNova',
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Calendar", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.w800, fontSize: 17)),
                            TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                            TextSpan(text: "View upcoming session.",  style: TextStyle(fontFamily: 'OpenSans', fontSize: 13)),
                          ]
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}