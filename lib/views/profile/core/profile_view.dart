part of 'profile_imports.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileProvider>(context, listen: false).getProfileData();
    });
  }

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
            ProfileVerticalList()
          ]),
        ),
      ),
    );
  }
}
