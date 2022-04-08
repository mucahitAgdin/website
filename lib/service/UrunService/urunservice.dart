import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ic_camasir_site/service/UrunService/urunmodel.dart';

class UrunService {
  static var database = FirebaseFirestore.instance;
  static List<UrunModel> urunList = [];

  static Future urunCek() async {
    urunList.clear();
    await database.collection('urunler').get().then((value) {
      for (var element in value.docs) {
        urunList.add(UrunModel.fromSnapShot(element));
      }
    });
  }
}
