import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/screens/screens.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun Pengguna',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 54, 65, 71),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("images/person.png"))),
              ),
              SizedBox(height: 10),
              Text(
                "Nama User",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "twincat@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Profile",
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 141, 165, 178),
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              // ListTile(
              //   onTap: () {},
              //   title: Text(
              //     "Ganti Password",
              //     style: TextStyle(fontSize: 15),
              //   ),
              //   trailing: Container(
              //     width: 30,
              //     height: 30,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(100),
              //       color: Colors.grey.withOpacity(0.1),
              //     ),
              //   ),
              // ),

              // ListTile(
              //   onTap: () {},
              //   leading: Container(
              //     width: 40,
              //     height: 40,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         color: Colors.blueAccent.withOpacity(0.1)),
              //     child: Icon(LineIcons.phone, color: Colors.blueAccent),
              //   ),
              //   title: Text(
              //     "Pusat Layanan",
              //     style: TextStyle(fontSize: 17),
              //   ),
              // ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blueAccent.withOpacity(0.1)),
                  child: Icon(LineIcons.alternateSignOut,
                      color: Colors.blueAccent),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 17, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
