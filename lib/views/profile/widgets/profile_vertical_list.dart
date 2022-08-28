part of '../profile_imports.dart';

class ProfileVerticalList extends StatelessWidget {
  const ProfileVerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 48.4 * mediaSize.height / 100,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Padding(
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
                      child: Image.asset(
                        "assets/CAT.png",
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Awesome cat",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        "Very nice cat with cute ears",
                        style: TextStyle(
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
                              ButtonGradientColor.removeButtonOneColor,
                              ButtonGradientColor.removeButtontwoColor
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
                              ApplicationStrings.removeString,
                              style: TextStyle(
                                  letterSpacing: 1.25,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      ButtonGradientColor.removeuttonOneColor),
                            )),
                      )
                    ],
                  )
                ]),
              ),
            );
          })),
    );
  }
}
