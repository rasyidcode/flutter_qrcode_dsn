import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_item.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';
import 'package:flutter_presensi_dsn/ui/home/home_bloc.dart';
import 'package:flutter_presensi_dsn/ui/home/home_state.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_title.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/perkuliahan_time.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardItem2 extends StatefulWidget {
  final PerkuliahanItem perkuliahanItem;

  const CardItem2({required this.perkuliahanItem, Key? key}) : super(key: key);

  @override
  State<CardItem2> createState() => _CardItem2State();
}

class _CardItem2State extends State<CardItem2> {
  String getQrData() => 'PRESENSI_SECRET_${widget.perkuliahanItem.idJadwal}';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ClipPath(
            child: Column(
              children: [
                // CARD BORDER
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
                // CARD CONTENT
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CARD TITLE
                      CardTitle(title: widget.perkuliahanItem.namaMatkul),
                      const SizedBox(height: 8.0),
                      PerkuliahanTime(
                        beginTime: widget.perkuliahanItem.beginTime,
                        endTime: widget.perkuliahanItem.endTime,
                      ),
                      const SizedBox(height: 16.0),
                      // CARD BODY
                      BlocConsumer<HomeBloc, HomeState>(
                        listener: (context, state) {
                          if (state.isLoading &&
                              (state.loadingType ==
                                      HomeStateLoadingType.postQr ||
                                  state.loadingType ==
                                      HomeStateLoadingType.submitPerkuliahan) &&
                              state.currentIdJadwal ==
                                  int.parse(widget.perkuliahanItem.idJadwal)) {
                            setState(() {
                              isLoading = true;
                            });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        builder: (context, state) {
                          bool isSubmitPerkuliahanLoading = state.loadingType ==
                              HomeStateLoadingType.submitPerkuliahan;
                          bool isCreateQRSuccess =
                              widget.perkuliahanItem.qrsecret != null ||
                                  state.successType ==
                                      HomeStateSuccessType.postQr;
                          bool isSubmitSuccess =
                              widget.perkuliahanItem.qrsecret != null ||
                                  state.successType ==
                                      HomeStateSuccessType.submitPerkuliahan;
                          if (widget.perkuliahanItem.statusPerkuliahan ==
                                  'done' ||
                              isSubmitSuccess) {
                            return const Center(
                              child: Text(
                                'Detail Perkuliahan',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: kButtonColor2),
                              ),
                            );
                          }

                          return Column(
                            children: [
                              isLoading
                                  ? Column(
                                      children: const [
                                        CircularProgressIndicator(),
                                        SizedBox(height: 16.0),
                                      ],
                                    )
                                  : Container(),
                              isCreateQRSuccess || isSubmitPerkuliahanLoading
                                  ? Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: QrImage(
                                            data: getQrData(),
                                            version: QrVersions.auto,
                                            size: 150,
                                          ),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],
                                    )
                                  : Container(),
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
                                        String? accessToken =
                                            state.auth.accessToken;
                                        if (accessToken != null &&
                                            accessToken.isNotEmpty) {
                                          if (isCreateQRSuccess) {
                                            BlocProvider.of<HomeBloc>(context)
                                                .submitPerkuliahan(
                                                    accessToken,
                                                    int.parse(widget
                                                        .perkuliahanItem
                                                        .idJadwal));
                                          } else {
                                            BlocProvider.of<HomeBloc>(context)
                                                .postQR(
                                                    accessToken,
                                                    int.parse(widget
                                                        .perkuliahanItem
                                                        .idJadwal),
                                                    getQrData());
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Access token is empty')));
                                        }
                                      },
                                      minWidth: 0.0,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      color: isCreateQRSuccess ||
                                              isSubmitPerkuliahanLoading
                                          ? Colors.red
                                          : kButtonColor2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        isCreateQRSuccess ||
                                                isSubmitPerkuliahanLoading
                                            ? 'Akhiri Perkuliahan'
                                            : 'Buat QR',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          );
                        },
                      ),
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
