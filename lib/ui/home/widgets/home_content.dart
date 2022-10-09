import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/extensions/string_extensions.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';
import 'package:flutter_presensi_dsn/ui/home/home_bloc.dart';
import 'package:flutter_presensi_dsn/ui/home/home_state.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_item.dart';
import 'package:flutter_presensi_dsn/extensions/date_time_extensions.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_item2.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isLoading = false;
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  String? accessToken = state.auth.accessToken;
                  if (accessToken == null || accessToken.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryButtonColor,
                        ),
                      ),
                    );
                  }

                  var data = accessToken.jwtDecode()['data'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Halo, ${data['name']}',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        data['username'],
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  );
                }),
              ),
            ),
            Positioned(
              bottom: -18.0,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryButtonColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateTime.now().toCustomDateFormat(),
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 35.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isLoading &&
                    state.loadingType == HomeStateLoadingType.getList) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error.isNotEmpty) {
                  if (state.errorType == HomeStateErrorType.listEmpty) {
                    return const Center(
                        child: Text('Tidak ada perkuliahan hari ini'));
                  } else {
                    return Center(child: Text(state.error));
                  }
                }

                if (state.isSuccess) {
                  return ListView.builder(
                    itemCount: state.data.total,
                    itemBuilder: (context, index) {
                      return CardItem2(perkuliahanItem: state.data.data[index]);
                    },
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        )
      ],
    );
  }
}
