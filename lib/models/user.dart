import 'package:flutter/material.dart';

class UserDetail with ChangeNotifier{
  @required String uid;
  @required String? email; 
  @required String? name;
  @required String? img;  
  UserDetail(this.uid, this.email, this.name, this.img);
}