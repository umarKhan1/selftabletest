part of '../profile_imports.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "catholder-22",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Age: ',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  TextSpan(text: '21'),
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: 10.6 * mediaSize.height / 100,
            width: 21.3 * mediaSize.width / 100,
            child: Image.asset("assets/pc.png"))
      ],
    );
  }
}
