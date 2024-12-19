import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class TileTemplate extends StatelessWidget {
  const TileTemplate({super.key, required this.tile});

  final Widget tile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tile,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          child: Divider(
            height: 0,
            color: Theme.of(context).colorScheme.error.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
