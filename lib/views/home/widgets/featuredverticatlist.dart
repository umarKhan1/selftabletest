part of '../core/home_view_import.dart';

class FeaturedVerticalList extends StatefulWidget {
  const FeaturedVerticalList({Key? key}) : super(key: key);

  @override
  State<FeaturedVerticalList> createState() => _FeaturedVerticalListState();
}

class _FeaturedVerticalListState extends State<FeaturedVerticalList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FeaturedListProvider>(context, listen: false)
          .getFeaturedProduct();
    });
    // SchedulerBinding.instance.addPostFrameCallback((_) =>
    //     Provider.of<FeaturedListProvider>(context, listen: false)
    //         .getFeaturedProduct());
  }

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 26.4 * mediaSize.height / 100,
      child: Consumer<FeaturedListProvider>(builder: (context, value, _) {
        return value.featuremodellist.isEmpty
            ? homeShimmer(context)
            : value.error == "error"
                ? Text("sdsdsd")
                : ListView.builder(itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
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
                              child: Image.network(
                                value.featuremodellist[index].image!,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.featuremodellist[index].title!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                value.featuremodellist[index].subtitle!,
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
                    );
                  }));
      }),
    );
  }
}
