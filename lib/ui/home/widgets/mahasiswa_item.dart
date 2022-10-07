import 'package:flutter/material.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/data/models/mahasiswa_item.dart'
    as mhs_item;

class MahasiswaItem extends StatelessWidget {
  final mhs_item.MahasiswaItem item;
  const MahasiswaItem({required this.item, Key? key}) : super(key: key);

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
                      item.namaLengkap,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      item.nim,
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
