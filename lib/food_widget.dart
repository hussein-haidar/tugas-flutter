import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({super.key, this.title, this.deskripsi, this.image});

  final title;
  final deskripsi;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
                Expanded(child: Image.network(this.image)),
                Expanded(child: Text(this.title,style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                Expanded(child: Text(this.deskripsi))
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
              BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
        ]
      ),
    );
  }
}