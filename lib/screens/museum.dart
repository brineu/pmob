import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/providers/destination.dart';
import 'package:provider/provider.dart';

import '../widget/PlaceScreen.dart';

class Museum extends StatelessWidget {
  const Museum({super.key});

  @override
  Widget build(BuildContext context) {
    final dataTempat = Provider.of<Destination>(context).alldestination;
    final dataCategory = dataTempat.where((Destination) => Destination.category == 1).toList();
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
