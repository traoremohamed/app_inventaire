import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';


class InventaireView extends StatelessWidget {
  InventaireController invConst = Get.put(InventaireController());

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
                    InventaireForm(context),
                    buildInventaireAction(),

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
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Verification du code inventaire',
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
                  //onTap: () => Get.back(),
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

  Widget InventaireForm(context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text('code inventaire', style: TextStyle(color: Color(0xFF707070), fontSize: 18),),
          TextFormField(
            controller: invConst.tecCodeInventaire,
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

          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget buildInventaireAction(){
    return GestureDetector(
      onTap: () {
        invConst.inventaire();
        //vehConst.creationvehicule();
       // Get.toNamed(Routes.PRODUITINVENTORIE);
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
                      "Verifier",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                  ),

                  !invConst.isClickOnVerifieInv.value?
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




/*Widget build(BuildContext context) {
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
            FlatButton( onPressed: () => Get.toNamed(Routes.PRODUITINVENTORIE), child: Text('Commencer inventaire',style: TextStyle(fontSize: 20.0),))
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