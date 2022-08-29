part of 'home_view_import.dart';

class Homeview extends StatelessWidget {
  static const routeName = '/HomeView';
  const Homeview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5 * mediaSize.height / 100,
                ),
                const Text(
                  ApplicationStrings.featuredName,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
                ),
                SizedBox(
                  height: 2.6 * mediaSize.height / 100,
                ),
                FeaturedVerticalList(
                    status: "feature"), //Featured List has Sepreated widget
                SizedBox(
                  height: 4.2 * mediaSize.height / 100,
                ),
                const Text(
                  ApplicationStrings.allCats,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
                ),

                FeaturedVerticalList(
                  status: "",
                ), //AllCats List has Sepreated widget
              ],
            ),
          ),
        ),
      )),
    );
  }
}
