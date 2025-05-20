import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh),),
        ],
      ),
      body: Padding(padding:
      const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //firstcard

            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,
                  sigmaY: 10,),
                  child: Padding(padding:
                  const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('300 F',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Icon(Icons.cloud, size: 64),
                        const SizedBox(height: 16),
                        Text('RAIN', style: TextStyle(
                          fontSize: 28,

                        ),
                        ),
                      ],
                    ),
                  ),

                ),

              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'weather forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      HourlyForecastItem(timed:'3:00',
        icon:Icons.cloud,
        temperature: '4',
      ),
      HourlyForecastItem(timed:'13:00',
        icon:Icons.sunny,
        temperature: '44',),
      HourlyForecastItem(timed:'23:00',
        icon:Icons.cloud,
        temperature: '444',),
      HourlyForecastItem(timed:'8:00',
        icon:Icons.cloud,
        temperature: '444134',),
      HourlyForecastItem(timed:'9:00',
        icon:Icons.sunny,
        temperature: '444114',),
    ],
  ),
),
            const SizedBox(height: 20),
          const Text(
            'weather Forecast',
            style:TextStyle(
              fontSize: 24,
              fontWeight:FontWeight.bold,
            ),
          ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Aditionalinfo(
                  icon:Icons.water_drop,
                  label:'Humidity',
                  value:'91',
                ),
                Aditionalinfo(   icon:Icons.air,
                  label:'Wind Speed',
                  value:'7.5',),
                Aditionalinfo(   icon:Icons.beach_access,
                  label:'Pressure',
                  value:'1000',),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

class Aditionalinfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const Aditionalinfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
         icon,
          size:32,
        ),
        const SizedBox(height:8),
        Text(label),
        const SizedBox(height:8),
        Text(value,style:TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
      ],
    );
  }
}
class HourlyForecastItem extends StatelessWidget {
  final String timed;
  final String temperature;
  final IconData icon;
  const HourlyForecastItem({
    super.key,
    required this.timed,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation:6,
      child:Container(
        width:100,
      padding:const EdgeInsets.all(8.0),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(12),
      ),
        child: Column(
          children:[
            Text(
              timed,
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.bold,
              ),
            ),
           const SizedBox(height: 10,),
            Icon(
              icon,
              size:32,
            ),
          const SizedBox(height: 10,),
            Text(temperature),
          ],
        ),

    ),
    );
  }
}
