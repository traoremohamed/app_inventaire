import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventaire/models/inventaire.dart';

class InventaireManagement{
   static final box =GetStorage();


  static Future saveIventaire(Inventaire verifieInventaire) async {
      box.write('verifie_inventaire', verifieInventaire.toJson());
  }

  static readInventaire(){
    try{

      //Map inventaireMap = box.read('verifie_inventaire');
      Inventaire currentInventaire = Inventaire.fromJson(box.read('verifie_inventaire'));

      debugPrint("Current code inventaire is ::: ${currentInventaire.codeInventaire}");

      return currentInventaire;

    } catch(ex){
      debugPrint("Inventaire Management :: $ex");
    }
  }

   static Future supprimerverfieInventaire() async{
     box.remove("verifie_inventaire");
     box.erase();
     Get.delete();
   }
}