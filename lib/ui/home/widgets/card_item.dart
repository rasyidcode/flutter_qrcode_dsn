import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_title.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/mahasiswa_item.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/perkuliahan_time.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardItem extends StatelessWidget {
  final bool hideQR;
  const CardItem({required this.hideQR, Key? key}) : super(key: key);

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
                      const CardTitle(title: 'Pengenalan Pemrograman'),
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
                      const PerkuliahanTime(),
                      const SizedBox(height: 16.0),
                      !hideQR
                          ? Column(
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
                            )
                          : Container(),
                      // MAHASISWA LIST
                      !hideQR
                          ? Column(
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
                            )
                          : Container(),
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
                      ),
                      !hideQR
                          ? Container(
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
                          : Container()
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
