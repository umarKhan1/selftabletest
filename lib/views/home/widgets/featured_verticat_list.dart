part of '../core/home_view_import.dart';

// ignore: must_be_immutable
class FeaturedVerticalList extends StatelessWidget {
  String? status;
  FeaturedVerticalList({Key? key, required this.status}) : super(key: key);
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('featuredproduct').snapshots();
  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // Handling errors from firebase
        if (snapshot.hasError) {
          return const Text("we have some problems loading featured cats 😿");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return homeShimmer(context);
        }
        return SizedBox(
          height: status == "feature"
              ? 26.4 * mediaSize.height / 100
              : 37.4 * mediaSize.height / 100,
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: snapshot.data!.docs[index]['isadd'] == true
                    ? Container()
                    : Container(
                        height: 13.2 * mediaSize.height / 100,
                        width: 91 * mediaSize.width / 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1)),
                        child: Row(children: [
                          SizedBox(
                              height: 13 * mediaSize.height / 100,
                              width: 26 * mediaSize.width / 100,
                              child: FancyShimmerImage(
                                imageUrl: snapshot.data!.docs[index]['imgurl'],
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.docs[index]['title'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                snapshot.data!.docs[index]['subtitle'],
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
                                    gradient: snapshot.data!.docs[index]
                                                ["isadd"] ==
                                            false
                                        ? const LinearGradient(colors: [
                                            ButtonGradientColor
                                                .addButtonOneColor,
                                            ButtonGradientColor
                                                .addButtonTneColor
                                          ])
                                        : const LinearGradient(colors: [
                                            ButtonGradientColor
                                                .removeButtonOneColor,
                                            ButtonGradientColor
                                                .removeButtontwoColor
                                          ]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      onSurface: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      Provider.of<FeaturedListProvider>(context,
                                              listen: false)
                                          .updateprovider(
                                              snapshot.data!.docs[index]['did'],
                                              snapshot.data!.docs[index]
                                                          ["isadd"] ==
                                                      false
                                                  ? true
                                                  : false);
                                    },
                                    child: Text(
                                      snapshot.data!.docs[index]["isadd"] ==
                                              false
                                          ? ApplicationStrings.addString
                                          : ApplicationStrings.removeString,
                                      style: TextStyle(
                                          color: snapshot.data!.docs[index]
                                                      ["isadd"] ==
                                                  false
                                              ? ButtonGradientColor
                                                  .buttonTextColor
                                              : ButtonGradientColor
                                                  .removeuttonOneColor),
                                    )),
                              )
                            ],
                          )
                        ]),
                      ),
              );
            }),
            // Got rid of Task class
          ),
        );
      },
    );
  }
}
