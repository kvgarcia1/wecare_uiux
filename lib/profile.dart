import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

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