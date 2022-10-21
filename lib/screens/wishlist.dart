import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/widgets/movie_card.dart';

class WishListPage extends StatefulWidget {
  final List<int> wishListIds;
  final void Function(int) onToggleWishList;

  const WishListPage(this.wishListIds, this.onToggleWishList, {super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  Future<List<MovieModel>> _getData() async {
    String res = await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    return MovieModel.fromList(jsonDecode(res));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<MovieModel> wishMovies = snapshot.data!.where((e) => widget.wishListIds.any((element) => element == e.id)).toList();
          return Padding(
            padding: EdgeInsets.only(left: 10),
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              children: List.generate(
                wishMovies.length,
                (index) => MovieCard(wishMovies[index], widget.wishListIds, widget.onToggleWishList),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
