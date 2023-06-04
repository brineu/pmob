import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/place.dart';
import 'package:flutter_application_1/widget/PlaceDetail.dart';
import 'package:provider/provider.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataTempat = Provider.of<Place>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaceDetail(dataTempat.name, dataTempat.img, dataTempat.desc)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(dataTempat.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              dataTempat.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
