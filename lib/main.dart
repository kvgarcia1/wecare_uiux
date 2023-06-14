import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

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
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  
  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
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
  Placeholder(),
  GeneratorPage(),
  Placeholder(),
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
          backgroundColor: Color(0xFFF9F9F9),
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

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
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
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Upcoming Session", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.bold, fontSize: 16)),
                            TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                            TextSpan(text: "No upcoming session. Contact your designated physician to book a session schedule."),
                          ]
                        )
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      // padding: const EdgeInsets.only(left: 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint('1');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF0000),
                          foregroundColor: Colors.white,
                          side: BorderSide.none, shape: const StadiumBorder(),
                        ),
                        child: Text('Start', style: TextStyle(fontWeight: FontWeight.bold)),
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
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Connectivity", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.bold, fontSize: 16)),
                                  TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                                  TextSpan(text: "Device is connected."),
                                ]
                              )
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('1');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE7E9EC),
                                foregroundColor: Color(0xFF7B7B7B),
                                side: BorderSide.none, shape: const StadiumBorder(),
                              ),
                              child: Text('Connect', style: TextStyle(fontWeight: FontWeight.bold)),
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
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Journal", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.bold, fontSize: 16)),
                                  TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                                  TextSpan(text: "You have not written a journal entry yet."),
                                ]
                              )
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint('1');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF0000),
                                foregroundColor: Colors.white,
                                side: BorderSide.none, shape: const StadiumBorder(),
                              ),
                              child: Text('Create New Entry', style: TextStyle(fontWeight: FontWeight.bold)),
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
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Calendar", style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.bold, fontSize: 16)),
                            TextSpan(text: "\n\n", style: TextStyle(fontSize:5)),
                            TextSpan(text: "View upcoming session."),
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Icon(Icons.account_circle_outlined, size: 120)) //change code to profile pic from dtbs
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.yellow),
                      child: const Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),              
              Text("Kristine Mae Garcia", style: Theme.of(context).textTheme.headlineMedium),
              Text("garcia.kristinemae@gmail.com", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              // Edit Profile
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    side: BorderSide.none, shape: const StadiumBorder()
                  ),
                  child: const Text("Edit Profile",
                  style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // MENU
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
              ProfileMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.green.withOpacity(0.1),
        ),
        child: const Icon(Icons.settings),
      ),
    );
  }
}