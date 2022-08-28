import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:selftabletest/models/feature_model.dart';

class FeaturedListProvider extends ChangeNotifier {
  List<FeaturedModel> featuremodellist = [];
  String? error;
  void getFeaturedProduct() async {
    featuremodellist = [];
    try {
      await FirebaseFirestore.instance
          .collection("featuredproduct")
          .get()
          .then((productget) {
        for (var element in productget.docs) {
          featuremodellist.add(FeaturedModel(
              title: element['title'],
              image: element['imgurl'],
              subtitle: element['subtitle']));
        }
        notifyListeners();
      });
    } catch (e) {
      if (e.toString() != "") {
      } else {
        error = "error";
        notifyListeners();
      }
    }
  }
}
