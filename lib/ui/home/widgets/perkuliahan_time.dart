import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';

class PerkuliahanTime extends StatelessWidget {
  final String beginTime;
  final String endTime;
  const PerkuliahanTime(
      {required this.beginTime, required this.endTime, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
            color: kAccentColor, borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Mulai\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Selesai',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$beginTime\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  TextSpan(
                    text: endTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
