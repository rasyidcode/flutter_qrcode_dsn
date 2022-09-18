import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';

class MahasiswaItem extends StatelessWidget {
  const MahasiswaItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Text('PP'),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joko Widodo',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '2020.11.2020.0001',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                )
              ],
            ),
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 12.0,
              child: Icon(Icons.done, color: Colors.white), // Icons.close
            )
          ],
        ),
        const SizedBox(height: 8.0)
      ],
    );
  }
}
