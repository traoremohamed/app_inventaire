import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventaire/models/inventaire.dart';
import 'package:inventaire/services/serivces.dart';
import 'package:inventaire/utils/inventaire_management.dart';

class ProduitInventorieController extends GetxController {
  TextEditingController tecCodeInventaire = TextEditingController();
  TextEditingController tecCodeProduit = TextEditingController();
  TextEditingController tecQte = TextEditingController(text: "1");

  String _scanBarcode = 'Unknown';
  //var currentusers = Users.empty().obs;

  var currentInventaire = Inventaire.empty().obs;

  var statusCodeInventaire = 0.obs;
  var isClickOnProduitInv = false.obs;

  late Timer timerLog;



  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() {
    //currentusers(UserManagement.readUser());
    currentInventaire(InventaireManagement.readInventaire());
  }


  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    tecQte.text = 'Complete the story from here...';
  }*/

  DateTime now = DateTime.now();

  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  ajouterproduitinvent() {

    isClickOnProduitInv(true);

    Services apiService = Services();

    apiService.ajoutproduitinventaire(currentInventaire.value.codeInventaire, tecCodeProduit.text, tecQte.text).then((response){
      statusCodeInventaire(response.statusCode);

      if(statusCodeInventaire == 200){

        debugPrint(
            "=======================================================================");

        debugPrint(
            "Enregistrement ok");
        debugPrint(
            "=======================================================================");

        Get.snackbar("Inventorie", "Succes ${response.statusCode} Enregistrement effectué");
        isClickOnProduitInv(false);


      }else{
        debugPrint("error ${response.statusCode}");
        //Get.snackbar("Inventorie", "Error ${response.data['error']}");
        Get.snackbar("Inventorie", "Error ${response.statusCode} Non enregister");
        isClickOnProduitInv(false);
      }

    });

  }


}