import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_bloc.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_state.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<WelcomeBloc>(context).flagFirstTime();
      },
      style: ElevatedButton.styleFrom(
        primary: kPrimaryButtonColor,
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: SizedBox(
        width: 200.0,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            const Text(
              'Mulai',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                const Spacer(),
                BlocBuilder<WelcomeBloc, WelcomeState>(
                  builder: (context, state) {
                    return Opacity(
                      opacity: state.isLoading ? 1 : 0,
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: kAccentColor,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8.0)
              ],
            )
          ],
        ),
      ),
    );
  }
}
