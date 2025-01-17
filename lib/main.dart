import 'package:fl_damflix/providers/movies_provider.dart';
import 'package:fl_damflix/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:fl_damflix/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // Configurar la aplicación para que se abra en pantalla completa
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive); // Modo inmersivo

  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoviesProvider(), lazy: false)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DAMFLIX',
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomeScreen(),
        'details':(context) => const DetailsScreen()
      },
      theme: AppTheme.ligthTheme
    );
  }
}