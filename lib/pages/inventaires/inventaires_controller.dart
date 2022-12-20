import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventaire/models/inventaire.dart';
import 'package:inventaire/services/serivces.dart';
import 'package:inventaire/utils/inventaire_management.dart';

import '../../routes/app_pages.dart';

class InventaireController extends GetxController {

  TextEditingController tecCodeInventaire = TextEditingController();

  var statusCodeInventaire = 0.obs;
  var isClickOnVerifieInv = false.obs;

  Inventaire currentInventaire = Inventaire.empty();

  //Timer timerLog;
  @override
  /*void onInit() {

    /*Inventaire currentInventaire = InventaireManagement.readInventaire();

    if(currentInventaire != null && !currentInventaire.numInventaire.isNull){
      //Aller à MainView
      debugPrint("Code inventaire exist");
      Get.offAllNamed(Routes.PRODUITINVENTORIE);
    }else{
      debugPrint("Pas de code d'inventaire");
    }*/

    super.onInit();
  }*/

  @override
  void read() {
      try{

        currentInventaire = InventaireManagement.readInventaire();

        if(currentInventaire != null && !currentInventaire.numInventaire.isNull){
          //Aller à MainView
          debugPrint("Code inventaire exist");
          Get.offAllNamed(Routes.PRODUITINVENTORIE);
        }else{
          debugPrint("Pas de code d'inventaire");
        }

      } catch(ex){
        debugPrint("Inventaire courant est null");
      }

      super.onReady();
  }

  inventaire(){

    isClickOnVerifieInv(true);

    Services ViService = Services();
    
    ViService.verificationinventaire(tecCodeInventaire.text).then((response){
      statusCodeInventaire(response.statusCode);
      debugPrint("resultat ${response.data}");
      if(statusCodeInventaire == 200){
        isClickOnVerifieInv(false);

        debugPrint("Incoming data");
        debugPrint(
            "=======================================================================");
        debugPrint(
            "=======================================================================");
        debugPrint(
            "=======================================================================");
        debugPrint(
            "=======================================================================");

        Inventaire inventaire = Inventaire.fromJson(response.data['resultat']);

        InventaireManagement.saveIventaire(inventaire).whenComplete(() => Get.offAndToNamed(Routes.PRODUITINVENTORIE));

        //Get.toNamed(Routes.PRODUITINVENTORIE);
      }else if(statusCodeInventaire == 403){

        debugPrint("error ${response.statusCode}");
        Get.snackbar("Inventorie", "Error ${response.data['error']}");
        //Get.snackbar("Inventorie", "Error ${response.data['error']} Inventaire non valide");
        isClickOnVerifieInv(false);

      }else{
        debugPrint("error ${response.statusCode}");
        Get.snackbar("Inventorie", "Error ${response.data['error']}");
        //Get.snackbar("Inventorie", "Error ${response.data['error']} Inventaire non valide");
        isClickOnVerifieInv(false);
      }

    });

  }

}