import 'package:dio/dio.dart';
import 'package:inventaire/api/env.dart';

class Services {
  late Dio dio;

  /// services pour la verifcation de l'esxistance inventaire

  verificationinventaire(String CodeInv) async {

    try{

      dio = new Dio();

      var response = await dio.get(Env.URI_VERIFICATION_INVENTAIRE + "$CodeInv");

      print('Information inventaire: ${response.data}');

      return response;

    }on DioError catch(ex){
      print(ex.response?.statusCode);
      return ex.response;
    }

  }

  ajoutproduitinventaire(String CodeInventaire, String Codeproduit, String Quantite) async {

    try{

      dio = new Dio();

      var response = await dio.post(Env.URI_AJOUT_PRODUIT_INVENTAIRE, data: {
        'code_inventaire': CodeInventaire,
        'produit_inventaire': Codeproduit,
        'qte_inventaire': Quantite,
      });

      //T'as oublie de retourner la reponse
      return response;

    }on DioError catch(ex){
      print(ex.response?.statusCode);
      return ex.response;
    }

  }


}