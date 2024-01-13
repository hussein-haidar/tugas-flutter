import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_app/food_widget.dart';
import 'package:http/http.dart' as http;

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key, required this.title});

  final title;
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<dynamic> getData() async {
    print('hit');
    var response = await http.get(
      Uri.parse("https://6593b2ba1493b0116068ee69.mockapi.io/makanan"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    var obj = json.decode(response.body);
    print(obj);
    return obj;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.data);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data as List;
          return GridView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: FoodWidget(
                  title: data[index]["nama"],
                  deskripsi: data[index]["deskripsi"],
                  image: data[index]["urlGambar"],
                ),
              );
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
        },
      ),
    );
  }
}
