import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/route/app_page.dart';
import 'package:ghar_ka_sathi/view/in_home_services/carpenter_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/construction_detail_page.dart';
import 'package:ghar_ka_sathi/view/in_home_services/electrician_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/electronic_appliances.dart';
import 'package:ghar_ka_sathi/view/in_home_services/home_interior.dart';
import 'package:ghar_ka_sathi/view/in_home_services/home_renovation.dart';
import 'package:ghar_ka_sathi/view/in_home_services/packers_and_movers.dart';
import 'package:ghar_ka_sathi/view/in_home_services/painting_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/pest_control_and_disinfect.dart';
import 'package:ghar_ka_sathi/view/in_home_services/plumbing_details_screen.dart';
import 'package:ghar_ka_sathi/src/splash_screen.dart';
import 'package:ghar_ka_sathi/view/dashboard/dashboard_screen.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

Future<void> requestPermissions() async {
  if (await Permission.storage.isGranted) {
    // Storage permission already granted
    return;
  }

  // Request based on API level
  if (await Permission.manageExternalStorage.isDenied) {
    await Permission.manageExternalStorage.request();
  }

  if (await Permission.photos.isDenied) {
    await Permission.photos.request();
  }
}
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  requestPermissions();

  // configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Observer(builder: (_) {
      return GetMaterialApp(
          getPages: AppPage.list,
          navigatorKey: NavigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'GharKasathi',
          builder: EasyLoading.init(),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.dark,
          // scrollBehavior: SBehavior(),
          // supportedLocales: LanguageDataModel.languageLocales(),
          // localeResolutionCallback: (locale, supportedLocales) => locale,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            // '/HomeScreen': (context) => const HomeScreen(),
            '/DashboardScreen': (context) => const DashboardScreen(),
            '/Carpenter': (context) => const CarpenterDetailsScreen(),
            '/Construction': (context) =>  ConstructionDetailPage(),
            '/Electrician': (context) => const ElectricianDetailsScreen(),
            '/Plumber': (context) =>  PlumbingDetailsScreen(),
            '/Painting': (context) =>  PaintingDetailsScreen(),
            '/Cleaning': (context) =>  CleaningDetailsScreen(),
            '/Interior': (context) =>  HomeInterior(),
            '/ElectronicAppliances': (context) =>  ElectronicAppliances(),
            '/PackersMovers': (context) =>  PackersAndMovers(),
            '/PestControl': (context) => const PestControlAndDisinfect(),
            '/HomeRenovation': (context) =>  HomeRenovation(),
          });
    // });
  }
}

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//     ..loadingStyle = EasyLoadingStyle.dark
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = Colors.white
//     ..backgroundColor = Colors.green
//     ..indicatorColor = Colors.white
//     ..textColor = Colors.white
//     ..userInteractions = false
//     ..maskType = EasyLoadingMaskType.black
//     ..dismissOnTap = true;
// }
