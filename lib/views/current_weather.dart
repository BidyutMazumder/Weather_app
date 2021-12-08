import 'package:flutter/material.dart';

Widget CurrentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        Icon(
          icon,
          color: Colors.amberAccent,
          size: 64.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$temp",
          style: const TextStyle(fontSize: 60),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$location",
          style: TextStyle(fontSize: 30),
        ),
      ],
    ),
  );
}
