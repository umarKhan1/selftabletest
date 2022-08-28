part of 'profile_imports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const ProfileData(),
            SizedBox(
              height: 4.2 * mediaSize.height / 100,
            ),
            const Text(
              ApplicationStrings.myCatString,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
            ),
            SizedBox(
              height: 2.8 * mediaSize.height / 100,
            ),
            const ProfileVerticalList()
          ]),
        ),
      ),
    );
  }
}
