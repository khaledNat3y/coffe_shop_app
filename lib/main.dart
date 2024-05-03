import 'package:coffe_shop_app/ui/home_screen/home.dart';
import 'package:coffe_shop_app/ui/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox("visited");
  // Check if it's the first time the user launches the app
  bool isFirstTime = box.get("firstVisited") ?? true;

  runApp( MyApp(initialRoute: isFirstTime ? OnBoardingScreen.routeName: HomeScreen.routeName,));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key,required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: initialRoute,
    );
  }
}

