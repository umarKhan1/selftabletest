import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:selftabletest/views/profile/core/profile_imports.dart';

import '../models/all_cat_model.dart';

class ProfileProvider extends ChangeNotifier {
  List<ProfiledataList> profileData = [];
  bool err = false, loading = false;
  void deleteNode({String? docid}) {
    FirebaseFirestore.instance.collection("selecteddata").doc(docid).delete();
  }

  void getProfileData() {
    profileData.clear();
    loading = true;
    notifyListeners();
    try {
      FirebaseFirestore.instance
          .collection("profile")
          .get()
          .then((profiledata) {
        for (var i in profiledata.docs) {
          profileData.add(ProfiledataList(
              age: i['age'], image: i['imgurl'], name: i['name']));
        }
        loading = false;
        err = false;
        notifyListeners();
      }).catchError((e) {
        err = true;
        loading = false;
        notifyListeners();
      });
    } catch (e) {
      return print(e);
    }
  }
}
