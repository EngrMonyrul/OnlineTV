import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvnet/controls/models/data_fetching_models.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final dataFetch = DataFetching();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.indigoAccent,
              floating: true,
              snap: true,
              leading: const Icon(
                CupertinoIcons.tv,
                color: Colors.white,
              ),
              actions: [
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              title: const Text(
                'TV.Net',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1/1,
              // child: CachedNetworkImage(
              //               //   imageUrl: dataFetch.ads[0]['adsimage'],
              //               // ),
            )
          ],
        )
      ),
    );
  }
}
