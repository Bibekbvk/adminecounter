import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String contact;
  final String name;
  final String ticket_for;
  final String vehicle_id;
  final String transaction_id;
  final String vehicle_number;
  final String link;
  final String status;
  UserModel({this.contact,this.name,this.ticket_for,this.vehicle_id,this.transaction_id,this.vehicle_number,this.link,this.status});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(
      contact: data['contact'],
      name: data['full_name'],
      ticket_for: data['ticket_for'],
      vehicle_id: data['vehicle_id'],
      transaction_id: data['transaction_id'],
      vehicle_number: data['vehicle_number'],
      link: data['link'],
      status:data['status'],

    );


  }



}