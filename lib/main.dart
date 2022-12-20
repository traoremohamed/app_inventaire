import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:inventaire/pages/main_binding.dart';
import 'package:inventaire/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
//void main() => runApp(MyApp());

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   /* return MaterialApp(
      title: 'Flutter File Upload Example',
      home: StartPage(),
    );*/
    return GetMaterialApp(
      title: 'Inventorie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      //home: Splash2(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 230),
      initialBinding: MainBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {

  SplashScreenController splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          //Faire un dégradé !
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/bienvenue/barinf.png',
                width: 120,
                height: 120,
              ),
            ),
          ),


          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 14),
              child: Column(
                children: <Widget>[
                  Text("BIENVENUE SUR BARNOIN INFORMATIQUE", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),),
                  Text("Votre application dedie a l'inventaire ", style: TextStyle(color: Colors.grey, fontSize: 12, ),),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class SplashScreenController extends GetxController{


  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time_in_app');

    if (firstTime != null && !firstTime) {
      // Not first time
      Timer(Duration(seconds: 5), () {
        Get.toNamed("/inventaire");
      });
    } else {
      // First time
      prefs.setBool('first_time_in_app', false);
      Timer(Duration(seconds: 2), () => Get.toNamed("/inventaire"));
    }
  }

  @override
  void onInit() {
    startTime();
    super.onInit();
  }
}

/*class StartPage extends StatelessWidget {

  //const data = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('code inventaire', style: Theme.of(context).textTheme.headline5,),
            TextFormField(
              //controller: ,
            ),
            FlatButton( onPressed: () {}, child: Text('Commencer inventaire',style: TextStyle(fontSize: 20.0),))
            /*GestureDetector(
              onTap: () {
                //'Commencer inventaire'
              },
            )*/
          ],
        ),
      ),
    );

  }

}*/

