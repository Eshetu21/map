import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/core/dependency_injection.dart';
import 'package:map/core/home/home_page.dart';
import 'package:map/core/theme/app_theme.dart';
import 'package:map/features/explore/presentation/blocs/places_bloc.dart';
import 'package:map/features/geolocation/geolocation_bloc.dart';

void main() {
  setUpDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<GeolocationBloc>()),
        BlocProvider(create: (_) => sl<PlacesBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        home: const HomePage(),
      ),
    );
  }
}

