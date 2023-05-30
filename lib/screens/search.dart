import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? _textEditingController = TextEditingController();
  List<String> rekomListOnSearch = [];
  List<String> rekomList = [
    'Tugu Pahlawan',
    'Camen',
    'Kopi Kenangan',
    'Kopi Komunitas',
    'Balai Pemuda',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onChanged: (value) {
              setState(() {
                rekomListOnSearch = rekomList
                    .where((element) =>
                        element.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Pencarian'),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                rekomListOnSearch.clear();
                _textEditingController!.clear();
                setState(() {
                  _textEditingController!.text = '';
                });
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
      ),
      body: _textEditingController!.text.isNotEmpty && rekomListOnSearch.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 80),
                  Text(
                    'No Results Founds',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _textEditingController!.text.isNotEmpty
                  ? rekomListOnSearch.length
                  : rekomList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _textEditingController!.text.isNotEmpty
                            ? rekomListOnSearch[index]
                            : rekomList[index],
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
