import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/Auth.dart';
import './signup_screen.dart';

import '../components/page_title_bar.dart';
import '../components/under_part.dart';
import '../constants.dart';
import '../widget/rounded_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

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
                //   imgUrl: "images/person.png",
                // ),
                const PageTitleBar(title: 'Login to your account'),
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
                          "Use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Column(
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
                                  hintStyle: TextStyle(fontFamily: 'OpenSans'),
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
                                  hintStyle: TextStyle(fontFamily: 'OpenSans'),
                                  suffixIcon: Icon(
                                    Icons.visibility,
                                    color: kPrimaryColor,
                                  ),
                                  border: InputBorder.none),
                            ),
                            switchListTile(),
                            RoundedButton(text: 'LOGIN', press: () async {
                              await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
                            }),
                            const SizedBox(
                              height: 10,
                            ),
                            UnderPart(
                              title: "Don't have an account?",
                              navigatorText: "Register here",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
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

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}

// iconButton(BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: const [
//       RoundedIcon(imageUrl: "images/facebook.png"),
//       SizedBox(
//         width: 20,
//       ),
//       RoundedIcon(imageUrl: "images/twitter.png"),
//       SizedBox(
//         width: 20,
//       ),
//       RoundedIcon(imageUrl: "images/google.jpg"),
//     ],
//   );
// }
