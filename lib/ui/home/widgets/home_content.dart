import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_item.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/card_title.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isLoading = false;
  bool isStarted = false;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, Bpk John Doe!',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      '2014.17.0001.2202',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
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
                    'Sabtu, 20 Agustus 2022',
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
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CardItem();
                }),
          ),
        )
      ],
    );
  }
}
