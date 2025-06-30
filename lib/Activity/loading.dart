import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Khanewal";
  late String temp;
  late String hum;
  late String air;
  late String des;
  late String main;
  late String icon;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air = instance.air;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    // Navigate after short delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          "temp_value": temp,
          "hum_value": hum,
          "air_value": air,
          "des_value": des,
          "main_value": main,
          "icon_value": icon,
          "city_value": city,
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // defer argument reading to after first build
    Future.microtask(() {
      final search = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (search != null && search['searchText'] != null) {
        city = search['searchText'];
      }
      startApp(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/image.jpg',
              height: 210,
              width: 210,
            ),
            const SizedBox(height: 10),
            const Text(
              "Weather App",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Made By Awais",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
