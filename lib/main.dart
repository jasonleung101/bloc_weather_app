import 'package:bloc_weather_app/bloc/country_list_cubit.dart';
import 'package:bloc_weather_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/location_cubit.dart';
import 'bloc/weather_cubit.dart';
import 'views/splash.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light) // Or Brightness.dark
      );
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await dotenv.load(fileName: ".env");
  HydratedBlocOverrides.runZoned(
    () => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<CountryListCubit>(
            create: (context) => CountryListCubit(),
          ),
          BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(),
          ),
          BlocProvider<LocationCubit>(
            create: (context) => LocationCubit(
              context.read<WeatherCubit>(),
              context.read<CountryListCubit>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SplashScreen(),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: mainBackgroundColor,
      ),
    );
  }
}
