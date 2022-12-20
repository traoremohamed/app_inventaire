import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
              physics: BouncingScrollPhysics(),
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
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
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
          SizedBox(height: 22),
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
          SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Ajoutez les produits à inventorier',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 27,
              ),
            ),
          ),
      ),
          SizedBox(height: 13),
        ],
      ),
    );
  }


  Widget _buildAppBar() {
    return Container(
      decoration: BoxDecoration(
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Icon(
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
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),),
          ),
          //Text('code inventaire', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
          TextFormField(
            controller: prodinvConst.tecCodeInventaire,
            decoration: InputDecoration(
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
          SizedBox(height: 15),
          /*Text('Scan result : $_scanBarcode\n',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 45,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                ),
                onPressed: () => barcodeScan(),
                child: const Text('Barcode Scan',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold))),
          ),
          //Text('code produit', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
          SizedBox(height: 15),*/
          TextFormField(
            controller: prodinvConst.tecCodeProduit,
            decoration: InputDecoration(
              hintText: "code produit",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),
          ),
          SizedBox(height: 15),
          //Text('Quantite', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
           TextFormField(
            controller: prodinvConst.tecQte,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            autofocus: false,
           // initialValue: i,
            decoration: InputDecoration(
              hintText: "Quantite",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF707070)),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget buildProduitInventorieAction(){
    return GestureDetector(
      onTap: () {
        //vehConst.creationvehicule();
        prodinvConst.ajouterproduitinvent();
        prodinvConst.tecCodeProduit.text = " ";
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.primaries.last,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          child: Obx(()=>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.only(left: 8.0),
                    onPressed: () {  },
                    child: Text(
                      "Enregister",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                  ),

                  !prodinvConst.isClickOnProduitInv.value?
                  Container(
                    decoration: BoxDecoration(
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
                  CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              ),),
        ),
      ),
    );
  }

  /*Widget CodeBarre extends StatefulWidget{

  }*/

  /*Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Text('code inventaire', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
            TextFormField(
              //controller: vehConst.tecImmatriculation,
              decoration: InputDecoration(
                hintText: "code inventaire",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),
            ),
            SizedBox(height: 15),

            //Text('code produit', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
            TextFormField(
              //controller: vehConst.tecImmatriculation,
              decoration: InputDecoration(
                hintText: "code produit",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),
            ),
            SizedBox(height: 15),
            //Text('Quantite', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
            TextFormField(
              //controller: vehConst.tecImmatriculation,
              decoration: InputDecoration(
                hintText: "Quantite",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF707070)),
                ),
              ),
            ),
            SizedBox(height: 15),
            FlatButton( onPressed: () {}, child: Text('Ajouter',style: TextStyle(fontSize: 20.0),))

            //FlatButton( onPressed: () {}, child: Text('Commencer inventaire1',style: TextStyle(fontSize: 20.0),))
            /*GestureDetector(
              onTap: () {
                //'Commencer inventaire'
              },
            )*/
          ],
        ),
      ),
    );
  }*/


}


