import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tvnet/controls/models/data_fetching_models.dart';
import 'package:tvnet/views/homePage/home_page_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  loadDatabase() async {
    final dataFetching = Provider.of<DataFetching>(context, listen: false);
    await dataFetching.adsFetching();
    await dataFetching.channelsFetching();
    await dataFetching.moviesFetching();
    await dataFetching.updatesFetching();
    dataFetching.navigatePage(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    loadDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/animation_lmbzz5xk.json'),
      ),
    );
  }
}
