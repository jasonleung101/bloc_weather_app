import 'package:bloc_weather_app/bloc/landing_selected_date_cubit.dart';
import 'package:bloc_weather_app/bloc/weather_cubit.dart';
import 'package:bloc_weather_app/model/one_call_weather.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingSelectedDateCubit(),
      child: Scaffold(
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
              OneCallWeather _data = weatherState.oneCallWeather;
              return Column(
                children: [
                  Expanded(
                    child: _UpperWeatherWidget(
                      data: _data,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UpperWeatherWidget extends StatelessWidget {
  _UpperWeatherWidget({
    Key? key,
    required OneCallWeather data,
  })  : _data = data,
        super(key: key);

  final OneCallWeather _data;
  final DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: Uri.encodeFull(
                "http://openweathermap.org/img/wn/${_data.current?.weather?[0].icon}.png",
              ),
              placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Text(
                  DateFormat('EEE, dd MMM').format(dateTime),
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
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
                _data.current?.temp?.toStringAsFixed(0) ?? 'N/A',
                style: const TextStyle(color: Colors.white, fontSize: 92),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, left: 12),
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
          'current location',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Feels like ' +
                    (_data.current?.feelsLike?.toStringAsFixed(0) ?? 'N/A') +
                    " ・ Sunset " +
                    (DateFormat("HH:MM").format(
                        DateTime.fromMillisecondsSinceEpoch(
                            _data.current?.sunrise ?? 0))),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        BlocBuilder<LandingSelectedDateCubit, SelectedDate>(
          builder: (context, selectedDateState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<LandingSelectedDateCubit>()
                            .update(SelectedDate.today);
                      },
                      child: const Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: selectedDateState == SelectedDate.today ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<LandingSelectedDateCubit>()
                            .update(SelectedDate.tomorrow);
                      },
                      child: const Text(
                        'Tomorrow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity:
                          selectedDateState == SelectedDate.tomorrow ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Row(
                    children: const [
                      Text(
                        'Next 7 Days',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.blueAccent,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
