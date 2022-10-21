import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: List.generate(
            provider.wishMovies.length,
            (index) => MovieCard(provider.wishMovies[index]),
          ),
        ),
      );
    }));
  }
}
