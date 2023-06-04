import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/edit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../providers/Auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
    final _auth = FirebaseAuth.instance.currentUser;
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
                        image: AssetImage(_auth!.photoURL.toString()))),
              ),
              SizedBox(height: 10),
              Text(
                _auth!.displayName.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                _auth.email.toString(),
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditScreen()));
                  },
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
                onTap: () async {
                  await authservice.signOut();
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
              ListTile(
                onTap: () async {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color.fromARGB(255, 141, 165, 178),
                      title:
                          Text("Delete Account", style: TextStyle(color: Colors.white)),
                      content: Text("Are you sure want to delete your account?",
                          style: TextStyle(color: Colors.white)),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            onPressed: () async {
                              await authservice.DeleteAcc();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Iya",
                              style: TextStyle(color: Colors.black),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 54, 65, 71),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Tidak",
                                style: TextStyle(color: Colors.black)))
                      ]);
                  });
                  
                },
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blueAccent.withOpacity(0.1)),
                  child: Icon(LineIcons.eraser, color: Colors.blueAccent),
                ),
                title: Text(
                  "Delete",
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
