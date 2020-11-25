import 'package:adminecounter/database.dart';
import 'package:adminecounter/display_booking.dart';
import 'package:adminecounter/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ShowUsers extends StatefulWidget {
  final String service;
  const ShowUsers({Key key, this.service}) : super(key: key);
  @override
  _ShowUsersState createState() => _ShowUsersState();
}
Database db = Database();
TextEditingController _ticketController = TextEditingController();
class _ShowUsersState extends State<ShowUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(stream:db.getuserdetailsfirebase(widget.service) , builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (BuildContext context,int index){
             String contact=snapshot.data[index].contact;
             String name=snapshot.data[index].name;
             String ticket_for=snapshot.data[index].ticket_for;
             String vehicle_id=snapshot.data[index].vehicle_id;
             List seat_number=snapshot.data[index].seat_number;
            UserModel moversmodel = UserModel(contact: contact,name: name,ticket_for: ticket_for,vehicle_id: vehicle_id,seat_number: seat_number);
            return Column(
              children: [
                Text("Name : $name"),
                Text("Contact Number : $contact"),
                Text('Vehicle Number : ${snapshot.data[index].vehicle_number}'),
                Text("Departure Date : ${snapshot.data[index].ticket_for}"),
               Text("Seat Number : ${snapshot.data[index].seat_number.toString()}"),
                TextField(
                  controller: _ticketController,
                ),
                RaisedButton(onPressed: (){
                 if(widget.service=="User Booking"){
                  FirebaseFirestore.instance.collection('${widget.service}').doc('${snapshot.data[index].transaction_id}').update({
                    'link':"${_ticketController.text}",
                    'status':'successfull',
                  });}
                 else{
                   FirebaseFirestore.instance.collection('${widget.service}').doc('${snapshot.data[index].transaction_id}').update({
                     'status':'successfull',
                   });
                 }
                },child: Text("Update ticket"),)

              ],

            );
          });
        }
        else{
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
