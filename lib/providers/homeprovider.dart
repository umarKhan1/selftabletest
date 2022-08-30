import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FeaturedListProvider extends ChangeNotifier {
  updateprovider(
      {String? collection,
      String? docid,
      String? imgurl,
      String? title,
      String? subtitle,
      bool? status}) async {
    FirebaseFirestore.instance
        .collection(collection.toString())
        .doc(docid)
        .update({"isadd": status});
    if (status == true) {
      FirebaseFirestore.instance.collection("selecteddata").doc(docid).set({
        "docid": docid,
        "collection": collection,
        "imgurl": imgurl,
        "title": title,
        "subtitle": subtitle
      });
    } else {
      FirebaseFirestore.instance.collection("selecteddata").doc(docid).delete();
    }
  }
}
