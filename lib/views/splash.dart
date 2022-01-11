import 'package:bloc_weather_app/bloc/location_cubit.dart';
import 'package:bloc_weather_app/bloc/weather_cubit.dart';
import 'package:bloc_weather_app/views/landing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<LocationCubit>().getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoaded) {
          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (_) => const LandingPage(),
              ),
              (route) => false);
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: Text('Weather Anywhere'),
          ),
        ),
      ),
    );
  }
}
