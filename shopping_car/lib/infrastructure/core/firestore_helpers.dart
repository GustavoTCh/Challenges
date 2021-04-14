import 'package:cloud_firestore/cloud_firestore.dart';


extension FirestoreX on FirebaseFirestore {
  CollectionReference getAllProduct()  {
    return FirebaseFirestore.instance
        .collection('products');
  }
}
extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('infos');
}
