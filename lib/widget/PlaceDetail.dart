import 'package:flutter/material.dart';


// ignore: must_be_immutable
class PlaceDetail extends StatelessWidget {
  @required String img;
  @required String desc;
  @required String name;
  PlaceDetail(this.name, this.img, this.desc);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Color(0xFFEDF2F6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      desc,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
