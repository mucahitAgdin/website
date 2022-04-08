import 'package:flutter/material.dart';

class Itemler {
  Widget item(String image, var height) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(4.0)),
      height: 50,
      width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
            height: height,
          ),
        ],
      ),
    );
  }
}
