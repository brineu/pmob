import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/destination.dart';
import '../widget/PlaceScreen.dart';

class resto extends StatelessWidget {
  const resto({super.key});

  @override
  Widget build(BuildContext context) {
    final dataTempat = Provider.of<Destination>(context).alldestination;
    final dataCategory = dataTempat.where((Destination) => Destination.category == 4).toList();
    return Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: dataCategory[index],
            child: PlaceScreen(),),
            itemCount: dataCategory.length,)
            );
  }
}