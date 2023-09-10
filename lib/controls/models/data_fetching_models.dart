import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tvnet/views/homePage/home_page_view.dart';
import 'package:flutter/foundation.dart';

class DataFetching extends ChangeNotifier{
  final List<Map<String, dynamic>> _ads = [];
  final List<Map<String, dynamic>> _updates = [];
  final List<Map<String, dynamic>> _channels = [];
  final List<Map<String, dynamic>> _movies = [];

  List<Map<String, dynamic>> get ads => _ads;
  List<Map<String, dynamic>> get updates => _updates;
  List<Map<String, dynamic>> get channels => _channels;
  List<Map<String, dynamic>> get movies => _movies;

  final CollectionReference adsIns = FirebaseFirestore.instance.collection('ads');
  final CollectionReference updatesIns = FirebaseFirestore.instance.collection('updates');
  final CollectionReference channelsIns = FirebaseFirestore.instance.collection('tvs');
  final CollectionReference moviesIns = FirebaseFirestore.instance.collection('movies');

  Future<void> adsFetching() async {
    try {
      _ads.clear();
      final QuerySnapshot querySnapshot = await adsIns.get();
      for (var documentSnapshot in querySnapshot.docs) {
        final Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          _ads.add(data);
        }
      }
    } catch (e) {
      debugPrint('Error fetching ads data: ${e.toString()}');
    }

    notifyListeners();
  }

  Future<void> updatesFetching() async {
    try {
      _updates.clear();
      final QuerySnapshot querySnapshot = await updatesIns.get();
      for (var documentSnapshot in querySnapshot.docs) {
        final Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          _updates.add(data);
        }
      }
    } catch (e) {
      debugPrint('Error fetching all movies data: ${e.toString()}');
    }

    notifyListeners();
  }

  Future<void> channelsFetching() async {
    try {
      _channels.clear();
      final QuerySnapshot querySnapshot = await channelsIns.get();
      for (var documentSnapshot in querySnapshot.docs) {
        final Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          _channels.add(data);
        }
      }
    } catch (e) {
      debugPrint('Error fetching all movies data: ${e.toString()}');
    }

    notifyListeners();
  }

  Future<void> moviesFetching() async {
    try {
      _movies.clear();
      final QuerySnapshot querySnapshot = await moviesIns.get();
      for (var documentSnapshot in querySnapshot.docs) {
        final Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          _movies.add(data);
        }
      }
    } catch (e) {
      debugPrint('Error fetching all movies data: ${e.toString()}');
    }

    notifyListeners();
  }

  void navigatePage(context){
    debugPrint(_ads.length.toString());
    debugPrint(_updates.length.toString());
    debugPrint(_channels.length.toString());
    debugPrint(_movies.length.toString());
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePageView()));
    });

    notifyListeners();
  }
}
