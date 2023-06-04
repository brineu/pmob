import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Auth.dart';
import '../login/components/page_title_bar.dart';
import '../login/components/under_part.dart';
import '../login/constants.dart';
import '../login/screens/login_screen.dart';
import '../login/widget/rounded_button.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final _auth = FirebaseAuth.instance.currentUser;

    final TextEditingController emailController =
        TextEditingController(text: _auth?.email.toString());

    final TextEditingController passwordController = TextEditingController();

    final TextEditingController nameController =
        TextEditingController(text: _auth?.displayName.toString());

    final TextEditingController photoController =
        TextEditingController(text: _auth?.photoURL.toString());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // const Upside(
                  //   imgUrl: "images/logo.png",
                  // ),
                  const PageTitleBar(title: 'Edit Account'),
                  Padding(
                    padding: const EdgeInsets.only(top: 320.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          // iconButton(context),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          const Text(
                            "Edit Your Account Information",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.person,
                                        color: kPrimaryColor,
                                      ),
                                      hintText: "Name",
                                      hintStyle:
                                          TextStyle(fontFamily: 'OpenSans'),
                                      border: InputBorder.none),
                                ),
                                TextFormField(
                                  controller: photoController,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.image,
                                        color: kPrimaryColor,
                                      ),
                                      hintText: "Profile Picture URL",
                                      hintStyle:
                                          TextStyle(fontFamily: 'OpenSans'),
                                      border: InputBorder.none),
                                ),
                                RoundedButton(
                                    text: 'EDIT',
                                    press: () async {
                                      await authService.updateUserData(
                                          nameController.text,
                                          photoController.text);
                                      Navigator.pop(context);
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
