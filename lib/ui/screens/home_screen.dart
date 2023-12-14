import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/weather_bloc.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img10.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoaded) {
                      return WeatherCard(weather: state.weather, cityName: _cityController.text);
                    } else {
                      return Container(
                        height: 300,
                        width: 400,
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _cityController,
                          decoration: InputDecoration(labelText: 'Enter city name'),
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      minimumSize: Size(200, 50),
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context).add(
                        GetWeatherEvent(cityName: _cityController.text, latitude: 0, longitude: 0),
                      );
                    },
                    child: Text(
                      'Get Weather',
                      style: TextStyle(fontSize: 20, color: Colors.orangeAccent.shade100),
                    ),
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoading) {
                        return CircularProgressIndicator();
                      } else if (state is WeatherError) {
                        return Text('${state.message}');
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 100),
              Text(
                'Random Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(height: 10),
              Opacity(
                opacity: 0.75,
                child: Text(
                  'Improve him believe opinion offered \nmet and end cheered forbade. Friendly \nas stronger speedily by recurred. Son \ninterest wandered sir addition end say. \nManners beloved affixed picture men ask.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
