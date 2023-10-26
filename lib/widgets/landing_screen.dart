import 'package:care_companion/constants/assets.dart';
import 'package:care_companion/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../routes.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var menu = [
    Assets.vitalsLog,
    Assets.painLog,
    Assets.exerciseLog,
    Assets.healthyRecipes,
    Assets.drugFoodInteraction,
    Assets.exercises,
    Assets.mentalHealthHelp,
    Assets.medicationReminder,
    Assets.prescriptionRefill
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.screenBg,
      appBar: AppBar(
        title: const Text('Care Companion', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(
            menu.length,
            (index) {
              return InkWell(
                onTap: () {
                  handleNavigation(index);
                },
                child: Container(
                    color: Colors.white,
                    child: Image.asset(menu[index], fit: BoxFit.cover)),
              );
            },
          ),
        ),
      ),
    );
  }

  void handleNavigation(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.vitalLogScreen);
        break;
      case 1:
        Navigator.pushNamed(context, Routes.painLogScreen);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.exerciseLogScreen);
        break;
      case 3:
        _launchURL(
            context, 'https://www.wholesomeyum.com/category/healthy-recipes/');
        break;
      case 4:
        _launchURL(
            context, 'https://www.drugs.com/interaction/list/?drug_list=');
        break;
      case 5:
        _launchURL(context, 'https://www.youtube.com/watch?v=Ev6yE55kYGw');
        break;
      case 6:
        _launchURL(context, 'https://www.youtube.com/@YellowBrickCinema');
        break;
      case 7:
        Navigator.pushNamed(context, Routes.medicineReminderScreen);
        break;
      case 8:
        Navigator.pushNamed(context, Routes.prescriptionRefillScreen);
        break;
    }
  }

  Future<void> _launchURL(BuildContext context, String url) async {
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: AppColors.themeColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: const SafariViewControllerOption(
          preferredBarTintColor: AppColors.themeColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
