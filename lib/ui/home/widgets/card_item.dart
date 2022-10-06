import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_item.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';
import 'package:flutter_presensi_dsn/ui/home/home_bloc.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_title.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/mahasiswa_item.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/perkuliahan_time.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardItem extends StatelessWidget {
  final PerkuliahanItem perkuliahanItem;
  const CardItem({required this.perkuliahanItem, Key? key}) : super(key: key);

  String getQrData() => 'PRESENSI_SECRET_${perkuliahanItem.idJadwal}';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ClipPath(
            child: Column(
              children: [
                Container(
                  height: 8.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [kPrimaryColor, Colors.white],
                      stops: [0.6, 0.6],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  // CARD CONTENT
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CARD TITLE
                      CardTitle(title: perkuliahanItem.namaMatkul),
                      const SizedBox(height: 4.0),
                      // CARD SUBTITLE
                      Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Text(
                          'Pertemuan Ke-1',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // CARD BODY
                      if (perkuliahanItem.statusPerkuliahan == 'done')
                        const Center(
                          child: Text(
                            'Detail Perkuliahan',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kButtonColor2),
                          ),
                        )
                      else if (perkuliahanItem.statusPerkuliahan ==
                          'not_started')
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                ),
                                onPressed: () {
                                  String? accessToken = state.auth.accessToken;
                                  if (accessToken != null &&
                                      accessToken.isNotEmpty) {
                                    BlocProvider.of<HomeBloc>(context).postQR(
                                        accessToken,
                                        int.parse(perkuliahanItem.idJadwal),
                                        getQrData());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Access token is empty')));
                                  }
                                },
                                minWidth: 0.0,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                color: kButtonColor2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Text(
                                  'Buat QR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      else if (perkuliahanItem.statusPerkuliahan == 'ongoing')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PerkuliahanTime(
                              beginTime: perkuliahanItem.beginTime,
                              endTime: perkuliahanItem.endTime,
                            ),
                            const SizedBox(height: 16.0),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: QrImage(
                                    data: '123456',
                                    version: QrVersions.auto,
                                    size: 150,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                              ],
                            ),
                            // MAHASISWA LIST
                            Column(
                              children: [
                                const CardTitle(title: 'Daftar Mahasiswa'),
                                const SizedBox(height: 4.0),
                                ListView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return const MahasiswaItem();
                                    }),
                                const SizedBox(height: 16.0),
                              ],
                            ),

                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                ),
                                onPressed: () {},
                                minWidth: 0.0,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                color: kAccentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Text(
                                  'Akhiri Perkuliahan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      else
                        const Center(
                          child: Text('Undefined status_perkuliahan'),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8.0)
      ],
    );
  }
}
