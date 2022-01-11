import 'package:bloc_weather_app/bloc/weather_cubit.dart';
import 'package:bloc_weather_app/model/weather.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const Icon(Icons.menu),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, weatherState) {
            WeatherResponse _data = weatherState.weatherResponse;
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: Uri.encodeFull(
                              "http://openweathermap.org/img/wn/${_data.weather![0].icon}.png",
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator.adaptive(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Today',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 32),
                              ),
                              Text(
                                DateFormat('EEE, dd MMM').format(dateTime),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              _data.main?.temp?.toStringAsFixed(0) ?? 'N/A',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 92),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 12),
                                child: Text(
                                  '°C',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _data.name ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Feels like ' +
                                  (_data.main?.feelsLike?.toStringAsFixed(0) ??
                                      'N/A') +
                                  " ・ Sunset " +
                                  (DateFormat("HH:MM").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          _data.sys?.sunrise ?? 0))),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
