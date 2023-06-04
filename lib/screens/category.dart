import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cafe.dart';
import 'package:flutter_application_1/screens/libur.dart';
import 'package:flutter_application_1/screens/museum.dart';
import 'package:flutter_application_1/screens/resto.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Museum()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("images/lmuseum.jpg"),
                        fit: BoxFit.cover))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const libur()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("images/llibur.jpg"),
                        fit: BoxFit.cover))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const cafe()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("images/lcafe.jpg"),
                        fit: BoxFit.cover))),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const resto()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("images/kuli.jpg"),
                        fit: BoxFit.cover))),
          ),
        ),
      ],
    ));
  }
}
