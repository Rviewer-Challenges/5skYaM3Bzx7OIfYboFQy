import 'package:flutter/material.dart';

class FavIcon extends StatelessWidget {
  final bool isFav;

  const FavIcon({Key? key, required this.isFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      isFav ? Icons.favorite_outlined : Icons.favorite_outline,
    );
  }
}
