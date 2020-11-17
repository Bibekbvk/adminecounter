import 'package:adminecounter/book_model.dart';
import 'package:adminecounter/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Database{
  Stream<List<UserModel>> getuserdetailsfirebase(String service) {
    var ref = FirebaseFirestore.instance.collection('$service');
    return ref.snapshots().map((val) => val.docs.map((docs) => UserModel.fromFireStore(docs)).toList());
  }

  Stream<List<BookModel>> getBookModelfirebase(String vehicle_id) {
    var ref = FirebaseFirestore.instance.collection('booking').where("vehicle_id",isEqualTo: "$vehicle_id");
    return ref.snapshots().map((val) => val.docs.map((docs) => BookModel.fromFireStore(docs)).toList());
  }


}