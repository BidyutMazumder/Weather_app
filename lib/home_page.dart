import 'package:ui_temp/services/weather_api_client.dart';

import 'model/weather_model.dart';
import 'views/aditional_info.dart';
import 'views/current_weather.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  WeatherApiClient client = WeatherApiClient();
  Weather data = Weather();

  Future<void>getData()async{
    data = await client.getCurrentdata("Dhaka");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Weather App"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CurrentWeather(Icons.wb_sunny_rounded, "${data.temp}k", "${data.cityName}"),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Adition Information",
                  style: TextStyle(
                      fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                aditionalinfo("${data.wind}","${data.humidity}","${data.pressure}","${data.feels_like}"),
              ],
            );
          }
          return Container();
        },

      ),
    );
  }
}
