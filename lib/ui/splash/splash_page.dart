import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image.asset('assets/logo_dsn.png'),
            ),
            Column(
              children: const [
                SizedBox(height: 20.0),
                CircularProgressIndicator(
                  color: kPrimaryButtonColor,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
