import 'package:flutter/material.dart';
import 'package:task1/constants.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff83C0C1),
        ),
        color: const Color(0xff96E9C6),
      ),
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: kCardTextDecor,
            ),
            Text(
              subtitle,
              style: kCardSubtextDecor,
            ),
          ],
        ),
      ),
    );
  }
}
