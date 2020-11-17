import 'package:adminecounter/database.dart';
import 'package:adminecounter/display_booking.dart';
import 'package:adminecounter/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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


            UserModel moversmodel = UserModel(contact: contact,name: name,ticket_for: ticket_for,vehicle_id: vehicle_id);

            return Column(

              children: [
                Text("$name"),
                Text("$contact"),
                Text('${snapshot.data[index].vehicle_number}'),
                Text("$vehicle_id"),
                TextField(
                  controller: _ticketController,

                ),
                RaisedButton(onPressed: (){
                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowVehicles(vehicle_id:vehicle_id)));*/
                  FirebaseFirestore.instance.collection('${widget.service}').doc('${snapshot.data[index].transaction_id}').update({
                    'link':"${_ticketController.text}",
                    'status':'successfull',
                  });


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
