import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selftabletest/providers/d.dart';
import 'package:selftabletest/providers/featuredprovider.dart';
import 'package:selftabletest/views/bottom_novigation.dart';
import 'package:selftabletest/views/home/core/home_view_import.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FeaturedListProvider>(
            create: (_) => FeaturedListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Selftabletest',
        theme: ThemeData(
            primaryColor: const Color(0xffE0E0E0), fontFamily: "Roboto"),
        home: BottomScreen(),
        onGenerateRoute: (setting) {
          WidgetBuilder builder = (context) => const BottomScreen();
          switch (setting.name) {
            case Homeview.routeName:
              builder = (context) => const Homeview();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: setting);
        },
      ),
    );
  }
}
