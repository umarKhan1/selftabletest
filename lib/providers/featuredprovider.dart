import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:selftabletest/models/feature_model.dart';

class FeaturedListProvider extends ChangeNotifier {
  List<FeaturedModel> featuremodellist = [];
  bool error = false, isloading = false;

  getFeaturedProduct() async* {
    try {
      isloading = true;
      notifyListeners();
      CollectionReference ref =
          FirebaseFirestore.instance.collection('featuredproduct');

      ref.snapshots(includeMetadataChanges: false).listen((event) {
        featuremodellist.clear();
        // ignore: avoid_function_literals_in_foreach_calls
        event.docChanges.forEach((element) {
          featuremodellist.add(FeaturedModel(
              title: element.doc['title'],
              image: element.doc['imgurl'],
              subtitle: element.doc['subtitle']));
          // }
        });

        // for (var c in event.docChanges) {
        //   featuremodellist.add(FeaturedModel(
        //       title: c.doc['title'],
        //       image: c.doc['imgurl'],
        //       subtitle: c.doc['subtitle']));
        // }

        isloading = false;
        error = false;
        notifyListeners();
      }).onError((e) {
        error = true;
        isloading = false;
        notifyListeners();
      });

      // await FirebaseFirestore.instance
      //     .collection("featuredproduct")
      //     .get()
      //     .then((productget) {
      //   for (var element in productget.docs) {
      //     featuremodellist.add(FeaturedModel(
      //         title: element['title'],
      //         image: element['imgurl'],
      //         subtitle: element['subtitle']));
      //   }
      //   isloading = false;
      //   error = false;
      //   notifyListeners();
      // }).catchError((e) {
      //   error = true;
      //   isloading = false;
      //   notifyListeners();
      // });
    } catch (e) {
      print(e);
    }
  }

  updateprovider(String? docid, bool? status) async {
    FirebaseFirestore.instance
        .collection("featuredproduct")
        .doc(docid)
        .update({"isadd": status});
  }
}
