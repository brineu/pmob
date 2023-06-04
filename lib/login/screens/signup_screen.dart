import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Auth.dart';
import '../components/page_title_bar.dart';
import '../components/under_part.dart';
import '../constants.dart';
import '../widget/rounded_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // const Upside(
                //   imgUrl: "images/logo.png",
                // ),
                const PageTitleBar(title: 'Create New Account'),
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
                          "or use your email account",
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
                                controller: emailController,
                                cursorColor: kPrimaryColor,
                                decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                      color: kPrimaryColor,
                                    ),
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(fontFamily: 'OpenSans'),
                                    border: InputBorder.none),
                              ),
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
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                cursorColor: kPrimaryColor,
                                decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.lock,
                                      color: kPrimaryColor,
                                    ),
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(fontFamily: 'OpenSans'),
                                    suffixIcon: Icon(
                                      Icons.visibility,
                                      color: kPrimaryColor,
                                    ),
                                    border: InputBorder.none),
                              ),
                              RoundedButton(
                                  text: 'REGISTER',
                                  press: () async {
                                    await authService
                                        .createUserWithEmailAndPassword(
                                            emailController.text,
                                            passwordController.text,
                                            nameController.text, photoController.text).then((value) => authService.updateUserData(nameController.text, photoController.text));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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
    );
  }
}
