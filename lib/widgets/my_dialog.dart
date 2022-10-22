import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/utils/index.dart';
import 'package:provider/provider.dart';

class MyDialog extends StatelessWidget {
  final MovieModel data;

  const MyDialog(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return Dialog(
          backgroundColor: Color.fromARGB(255, 33, 34, 37),
          insetPadding: EdgeInsets.zero,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      width: width,
                      height: width * 1.5,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            data.imgUrl,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_circle,
                                  color: Colors.grey.withOpacity(0.5),
                                  size: 60,
                                ),
                                SizedBox(height: 50),
                                Text(
                                  data.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${data.publishedYear} | ${Utils.integerMinToString(data.durationMin)} | ${data.type}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff777777),
                                  ),
                                ),
                                SizedBox(height: 70),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => provider.addWishList(data.id),
                                icon: Icon(
                                  provider.isWishMovie(data) ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Тайлбар",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.description ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
