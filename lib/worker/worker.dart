import 'dart:convert';
import 'package:http/http.dart';

class worker {
  late String location;

  worker({required this.location});

  late String temp;
  late String humidity;
  late String air;
  late String description;
  late String main;
  late String icon;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=f8e6a02abd467e836d9c1c1ef1b8ff72"));

      Map data = jsonDecode(response.body);

      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      Map wind = data['wind'];
      double getAir = wind["speed"] / 0.27777777777778;

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];
      String getIcon = weather_main_data['icon'];

      temp = getTemp.toStringAsFixed(1);
      humidity = getHumidity;
      air = getAir.toStringAsFixed(1);
      description = getDesc;
      main = getMain_des;
      icon = getIcon;

    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }
  }
}
