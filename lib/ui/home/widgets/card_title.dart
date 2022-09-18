import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: kPrimaryColor,
          width: 5.0,
          height: 18.0,
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 18.0),
          ),
        )
      ],
    );
  }
}
