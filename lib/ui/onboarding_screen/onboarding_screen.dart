import 'package:coffe_shop_app/ui/home_screen/home.dart';
import 'package:coffe_shop_app/ui/utils/app_colors.dart';
import 'package:coffe_shop_app/ui/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoardingScreen";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final box = Hive.box("visited");
  bool isFirstVisited = true;
  // @override
  // void initState() {
  //   super.initState();
  //   checkFirstTimeVisited();
  // }
  //
  // void checkFirstTimeVisited() async {
  //   bool isFirstTime = await getIsFirstVisited();
  //   if (!isFirstTime) {
  //     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image 3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Coffee so good,\nyour taste buds\nwill love it.",
                  style: AppTheme.largeFontStyle,
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "The best grain, the finest roast, the\n powerful flavor.",
                  textAlign: TextAlign.center,
                  style: AppTheme.smallFontStyle,
                ),
                SizedBox(height: 32,),
                buildButtonWidget(),
                SizedBox(height: 32,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.84,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.caramelColor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          )),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          isFirstVisited = !isFirstVisited;
          saveIsFirstVisited(isFirstVisited); // Set isFirstVisited to false after first visit
        },
        child: Text("Get Started", style: AppTheme.mediumFontStyle),
      ),
    );
  }

  void saveIsFirstVisited(bool isFirstVisited) {
    box.put("firstVisited", isFirstVisited);
  }

  // Future<bool> getIsFirstVisited() async {
  //   return box.get("firstVisited") ?? true; // Default value is true if it's null
  // }
}
