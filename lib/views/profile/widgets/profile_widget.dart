part of '../core/profile_imports.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Consumer<ProfileProvider>(
      builder: (context, v, _) {
        return v.loading
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Shimmer.fromColors(
                  baseColor: const Color(0xffE0E0E0).withOpacity(0.2),
                  highlightColor: const Color(0xffE0E0E0),
                  enabled: true,
                  period: const Duration(seconds: 10),
                  child: Container(
                    height: 13.2 * mediaSize.height / 100,
                    width: 91 * mediaSize.width / 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: const Center(
                      child: Text("SomeThing Loading"),
                    ),
                  ),
                ),
              )
            : v.err == true
                ? const Text(
                    "Sorry, we have some problems loading your profile 😿",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )
                : SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: v.profileData.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  v.profileData[index].name!,
                                  style: const TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'Age: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: v.profileData[index].age!,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                                height: 10.6 * mediaSize.height / 100,
                                width: 21.3 * mediaSize.width / 100,
                                child: FancyShimmerImage(
                                  imageUrl: v.profileData[index].image!,
                                ))
                          ],
                        );
                      },
                    ),
                  );
      },
    );
  }
}
