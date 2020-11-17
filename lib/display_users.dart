import 'package:adminecounter/database.dart';
import 'package:adminecounter/display_booking.dart';
import 'package:adminecounter/user_model.dart';
import 'package:flutter/material.dart';

class ShowUsers extends StatefulWidget {
  final String service;

  const ShowUsers({Key key, this.service}) : super(key: key);
  @override
  _ShowUsersState createState() => _ShowUsersState();
}
Database db = Database();
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
                Text("$ticket_for"),
                Text("$vehicle_id"),
                RaisedButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowVehicles(vehicle_id:vehicle_id)));


                })
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
