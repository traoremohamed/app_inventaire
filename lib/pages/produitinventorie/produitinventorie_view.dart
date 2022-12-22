import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core.dart';


class ProduitInventaireView extends StatelessWidget {

  ProduitInventorieController  prodinvConst = Get.put(ProduitInventorieController());
  /*String _scanBarcode = 'Unknown';


  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }
  Future<String> barcodeScan() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return _scanBarcode = barcodeScanRes;
    /*if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });*/
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 300,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildHeader(),
                    ProduitInventorieForm(context),
                    buildProduitInventorieAction(),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(),
          const SizedBox(height: 22),
          const SizedBox(height: 13),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Inventorie',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            /*Text(
              title: "Inventorie",
              fontSizeTitle: 27,
              spacer: 8,
              subtitle:
              "Ajoutez les produits à inventorier",
            ),*/
          ),
          const SizedBox(height: 8),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Ajoutez les produits à inventorier',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 27,
              ),
            ),
          ),
      ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }


  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 28,
                      )),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget ProduitInventorieForm(context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.7),
            child: Obx(()=> Text(
              prodinvConst.currentInventaire.value.codeInventaire,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),),
          ),
          //Text('code inventaire', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
          TextFormField(
            controller: prodinvConst.tecCodeInventaire,
            decoration: const InputDecoration(
              hintText: "code inventaire",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),
            enabled: false,
          ),
          const SizedBox(height: 15),

          TextFormField(
            controller: prodinvConst.tecCodeProduit,
            decoration:  InputDecoration(
              hintText: "code produit",
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder:const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              suffix: InkWell(
                child: const Icon(Icons.qr_code_scanner_rounded),
                onTap: (){
                  debugPrint("======> Should open barcode scanner");
                  scanBarcodeNormal();
                 /* Get.to(()=>  BarcodeScanner(), arguments: [
                    "barcode_data"
                  ])!.then((result){
                    if (result[0]["barcode_data"] != "") {
                      debugPrint("Result is not empty");
                      prodinvConst.tecCodeProduit.text = result[0]["barcode_data"];
                    }
                  });*/
                },
              )
            ),
          ),
          const SizedBox(height: 15),
          //Text('Quantite', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
           TextFormField(
            controller: prodinvConst.tecQte,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            autofocus: false,
           // initialValue: i,
            decoration: const InputDecoration(
              hintText: "Quantite",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget buildProduitInventorieAction(){
    return GestureDetector(
      onTap: () {
        //vehConst.creationvehicule();
       // prodinvConst.ajouterproduitinvent();
        prodinvConst.tecCodeProduit.text = " ";
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.primaries.last,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          child: Obx(()=>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 8.0),
                    onPressed: () {  },
                    child: const Text(
                      "Enregistrer",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                  ),

                  !prodinvConst.isClickOnProduitInv.value?
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.primaries.last,
                      ),
                    ),
                  ):
                  const CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              ),),
        ),
      ),
    );
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Annuler', true, ScanMode.BARCODE);
      debugPrint(barcodeScanRes);
      prodinvConst.tecCodeProduit.text = barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;


   // Get.back(result: [{"barcode_data": prodinvConst.tecCodeProduit.text}]);

  }


}



class BarcodeScanner extends StatelessWidget {
   BarcodeScanner({Key? key}) : super(key: key);

  TextEditingController tecCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeaderBarcode(),

            SizedBox(width: MediaQuery.of(context).size.width, height: 50,),

            TextFormField(
             controller: tecCont,
              decoration: const InputDecoration(
                hintText: "Barcode produit",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),

            ),

            buildButtonAction()
          ],
        ),
      ),
    );
  }

   // Platform messages are asynchronous, so we initialize in an async method.
   Future<void> scanBarcodeNormal() async {
     String barcodeScanRes;
     // Platform messages may fail, so we use a try/catch PlatformException.
     try {
       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
           '#ff6666', 'Annuler', true, ScanMode.BARCODE);
       debugPrint(barcodeScanRes);
       tecCont.text = barcodeScanRes;
     } on PlatformException {
       barcodeScanRes = 'Failed to get platform version.';
     }

     // If the widget was removed from the tree while the asynchronous platform
     // message was in flight, we want to discard the reply rather than calling
     // setState to update our non-existent appearance.
     //if (!mounted) return;
     Get.back(result: [{"barcode_data": tecCont.text}]);

   }


   Widget buildHeaderBarcode(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBarBarcode(),
          const SizedBox(height: 22),
          const SizedBox(height: 13),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Barcode',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Scanner le code du produit',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 27,
                ),
              ),
            ),
          ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }


  Widget buildAppBarBarcode() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 28,
                      )),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }

   Widget buildButtonAction(){
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 27),
       child: Container(
         decoration: BoxDecoration(
           color: Colors.primaries.last,
           borderRadius: const BorderRadius.all(
             Radius.circular(15),
           ),
         ),
         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         height: 60,
         child:  Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             MaterialButton(
               padding: const EdgeInsets.only(left: 8.0),
               onPressed: () {
                 Get.back(result: [{"barcode_data": tecCont.text}]);
               },
               child: const Text(
                 "Retour code produit",
                 style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),

             ),

             Container(
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(
                   Radius.circular(10),
                 ),
               ),
               height: 40,
               width: 40,
               child: Center(
                 child: Icon(
                   Icons.arrow_forward_ios,
                   color: Colors.primaries.last,
                 ),
               ),
             )
           ],
         )
       ),
     );
   }
}


