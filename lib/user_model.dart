import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String contact;
  final String name;
  final String ticket_for;
  final String vehicle_id;

  UserModel({this.contact,this.name,this.ticket_for,this.vehicle_id});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
      contact: data['contact'],
      name: data['name'],
      ticket_for: data['ticket_for'],
      vehicle_id: data['vehicle_id']

    );


  }



}