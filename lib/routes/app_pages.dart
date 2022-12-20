
import 'package:get/get.dart';
import '../core.dart';
import '../main.dart';

part 'app_routes.dart';

class AppPages {

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.INVENTAIRE, page: () => InventaireView()),
    GetPage(name: Routes.PRODUITINVENTORIE, page: () => ProduitInventaireView()),
    GetPage(name: Routes.SPLASH, page: () => SplashScreen(),

    ),
  ];

}