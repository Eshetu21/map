import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map/core/home/home_page.dart';
import 'package:map/core/theme/app_theme.dart';
import 'package:map/features/geolocation/geolocation_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => GeolocationBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        home: HomePage(),
      ),
    );
  }
}

