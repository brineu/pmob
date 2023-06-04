import 'package:flutter/material.dart';

import '../models/place.dart';

class Destination with ChangeNotifier{
  List<Place> _alldestination =[
    Place(1, 'Soto Cak Har', 'images/soto.jpg', 'lorem', 4),
    Place(2, 'Tropical Cafe', 'images/trop.jpeg', 'lorem', 3),
    Place(3, 'Balai Pemuda', 'images/balpem.jpg', 'lorem', 2),
    Place(4, 'Museum Pendidikan', 'images/pendidikan.jpg', 'lorem', 1),
    Place(5, 'Museum Sampoerna', 'images/sampoerna.jpg', 'lorem', 1),
    Place(6, 'Museum Tugu Pahlawan', 'images/tupal.jpg', 'lorem', 1),
    Place(7, 'Museum WR.Supratman', 'images/wr.jpg', 'lorem', 1),
    Place(8, 'Kebun Binatang Surabaya', 'images/kbs.jpg', 'lorem', 2),
    Place(9, 'Kya-Kya Surabaya', 'images/kya.jpg', 'lorem', 2),
    Place(10, 'Hutan Mangrove', 'images/mangrove.jpg', 'lorem', 2),
    Place(11, 'Ikhove', 'images/ikhove.jpg', 'lorem', 3),
    Place(12, "D'Coffe Cup Cafe", 'images/dcoffe.jpeg', 'lorem', 3),
    Place(13, 'Serlok Kopi', 'images/serlok.jpg', 'lorem', 3),
    Place(14, 'Mie Mapan', 'images/mapan.jpg', 'lorem', 4),
    Place(15, 'Bubur Ayam Spensix', 'images/spensix.jpg', 'lorem', 4),
    Place(16, 'Tahu Tek Ndublek', 'images/tek.jpg', 'lorem', 4),

  ];
  List<Place> get alldestination{
    return [..._alldestination];
  }
}