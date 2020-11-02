import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_ebay_flutter_firbase_app/models/product_model.dart';

class DatabaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewProduct(ProductModel productModel) async {
    bool retVal = false;
    DocumentReference documentReference;
    try {
      documentReference = _firestore.collection("MyProducts").doc();

      if (documentReference != null) {
        productModel.productId = documentReference.id;
        documentReference.set(productModel.toJson());
        retVal = true;
      } else {
        retVal = false;
      }
    } catch (e) {
      print('========== createNewProduct(): ERROR: $e');
    }

    return retVal;
  }

  Stream<QuerySnapshot> getMembersList() {

    return _firestore
        .collection("MyProducts")
        // .orderBy('createdDate', descending: true)
        .snapshots();
  }

  updateProductModel(ProductModel productModel) async {
    CollectionReference settingRef = _firestore.collection("MyProducts");
    await settingRef.doc(productModel.productId).update(productModel.toJson());
  }
  

  Future deleteProduct(ProductModel productModel) async {
    await _firestore.collection("MyProducts").doc(productModel.productId).delete();
  }

}
