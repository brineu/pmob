import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/destination.dart';
import 'package:provider/provider.dart';

import '../widget/PlaceScreen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataTempat = Provider.of<Destination>(context).alldestination;
    return Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: dataTempat[index],
            child: PlaceScreen(),),
            itemCount: dataTempat.length,)
    );
  }
}

