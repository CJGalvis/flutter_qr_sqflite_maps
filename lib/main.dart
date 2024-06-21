import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_sqlite/providers/scans_provider.dart';
import 'package:qrscanner_sqlite/providers/ui_provider.dart';
import 'package:qrscanner_sqlite/screens/screens.dart';
import 'package:qrscanner_sqlite/styles/styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScansProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'map': (_) => const MapScreen(),
        },
        theme: ThemeData(
          appBarTheme: appBarStyles(context),
        ),
      ),
    );
  }
}
