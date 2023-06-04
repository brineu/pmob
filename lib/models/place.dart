import 'package:flutter/material.dart';

class Place with ChangeNotifier{
  @required int id;
  @required String name;
  @required String img;
  @required String desc;
  @required int category;
  Place(this.id, this.name, this.img, this.desc, this.category);
}