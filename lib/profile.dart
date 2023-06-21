import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                      child: Image.asset('assets/images/profile.png')) //change code to profile pic from dtbs
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
              Text("Kristine Mae Garcia", style: TextStyle(color: Colors.black,fontSize: 25, fontFamily: 'ProximaNova',fontWeight: FontWeight.w600)),
              Text("garcia.kristinemae@gmail.com", style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'OpenSans')),
              const SizedBox(height: 20),

              // Edit Profile
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE56AEFF),
                    side: BorderSide.none, shape: const StadiumBorder()
                  ),
                  child: const Text("Edit Profile",
                  style: TextStyle(color: Colors.white,fontSize: 15, fontFamily: 'OpenSans')),
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                
                thickness: 0.5,
                color: Color(0xFF7B7B7B),
                indent: 0.0,
                endIndent: 0.0,

              ),
              const SizedBox(height: 20),


              Align(
                alignment: Alignment.centerLeft,
                child: Text("Personal Information", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("    Birthday:                            July 27, 1990\n    Age:                                    33 years old\n    Occupation:                       IT Specialist\n    Height:                               5' 3''\n    Weight:                              63 kg", style: TextStyle(fontSize: 15, fontFamily: 'OpenSans',color: Color(0xFF7B7B7B))),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Contact Information", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("    Phone Number:               09123456789\n    Address:                            Quezon City\n    In Case of Emergency:     Juan Dela Cruz\n                                               09987654321", style: TextStyle(fontSize: 15, fontFamily: 'OpenSans',color: Color(0xFF7B7B7B))),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Caregiver Information", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Color(0xFF4D4D4D))),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("    Name:                                Juanito Dela Cruz\n    Phone Number:               09567891234", style: TextStyle(fontSize: 15, fontFamily: 'OpenSans',color: Color(0xFF7B7B7B))),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Medical Information", style: TextStyle(fontSize: 20, fontFamily: 'ProximaNova', fontWeight: FontWeight.w800, color: Color(0xFF4D4D4D))),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("    Physiatric History\n    Current Medicines Taken\n    Pertinent Ancillary\n    Medical Management\n    Rehabilitation Goals\n    Rehabilitation Program\n", style: TextStyle(fontSize: 15, fontFamily: 'OpenSans',color: Color(0xFF7B7B7B))),
              ),


              

              
            ],
            
          ),
        ),

        

        // MENU

       




      ),
    );
  }
}