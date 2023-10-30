import 'package:cloud_firestore/cloud_firestore.dart';

moveto(String name, String Address, String Price,String collectionName) {
  CollectionReference deliveredProduct =
      FirebaseFirestore.instance.collection(collectionName);
  Map<String, dynamic> dataToMove = {
    "name": name,
    "Address": Address,
    "price": Price,
  };
  deliveredProduct.add(dataToMove);
}

Delete(String DocName,String CollectionName) {
  FirebaseFirestore.instance
      .collection(CollectionName)
      .doc(DocName)
      .delete();
}
