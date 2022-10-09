import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';

class MeContent extends StatelessWidget {
  const MeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return MaterialButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          onPressed: () {
            if (state.isHasAuth) {
              BlocProvider.of<AuthBloc>(context).logout(state.auth);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Logout failed, something went wrong')));
            }
          },
          minWidth: 0.0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        );
      }),
    );
  }
}
