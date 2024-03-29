import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/injection_container.dart';
import 'package:flutter_presensi_dsn/ui/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initKiwi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi QR Code Dosen',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldWhite,
      ),
      home: const SplashPage(),
    );
  }
}
