import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/login/screens/screens.dart';
import 'package:flutter_application_1/screen.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/Auth.dart';

class wrapper extends StatelessWidget {
  const wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
    return StreamBuilder<UserDetail?>(
      stream: authservice.user,
      builder: (_, AsyncSnapshot<UserDetail?> snapshot){
        if (snapshot.connectionState == ConnectionState.active){
          final UserDetail? user = snapshot.data;
          return user == null? LoginScreen() : Screen();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
  }
}