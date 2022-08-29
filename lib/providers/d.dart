// Importing firestore package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../utils/application_color.dart';
import '../utils/applicationstrings.dart';
import '../views/home/widgets/home_shimmer.dart';

class TODOList extends StatelessWidget {
  // Setting reference to 'tasks' collection
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('featuredproduct').snapshots();
  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO app'),
      ),
      // Making a StreamBuilder to listen to changes in real time
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // Handling errors from firebase
          if (snapshot.hasError) {
            return Text(
                "${snapshot.error}, we have some problems loading featured cats 😿");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return homeShimmer(context);
          }

          return ListView(
            // Got rid of Task class
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return SizedBox(
                  height: 26.4 * mediaSize.height / 100,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 13.2 * mediaSize.height / 100,
                      width: 91 * mediaSize.width / 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 1)),
                      child: Row(children: [
                        SizedBox(
                            height: 13 * mediaSize.height / 100,
                            width: 26 * mediaSize.width / 100,
                            child: FancyShimmerImage(
                              imageUrl: document['imgurl'],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              document['title'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              document['subtitle'],
                              style: const TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 4.4 * mediaSize.height / 100,
                              width: 54 * mediaSize.width / 100,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    ButtonGradientColor.addButtonOneColor,
                                    ButtonGradientColor.addButtonTneColor
                                  ]),
                                  borderRadius: BorderRadius.circular(8)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onSurface: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    ApplicationStrings.addString,
                                    style: TextStyle(
                                        color: ButtonGradientColor
                                            .buttonTextColor),
                                  )),
                            )
                          ],
                        )
                      ]),
                    ),
                  ));
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create'),
          child: const Icon(Icons.add)),
    );
  }
}
