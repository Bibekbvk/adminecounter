import 'package:adminecounter/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reserve extends StatefulWidget {
  @override
  _ReserveState createState() => _ReserveState();
}
TextEditingController _available_inController = TextEditingController();
TextEditingController _driverController = TextEditingController();
TextEditingController _driver_experienceController = TextEditingController();
TextEditingController _seat_capacityController = TextEditingController();
TextEditingController _pricingController = TextEditingController();
TextEditingController _vehicle_current_locationController = TextEditingController();
TextEditingController _vehicle_numberController = TextEditingController();
TextEditingController _imgController = TextEditingController();
String selectedcharging;
String selectedac;
String selectedwifi;
String selectedtv;

TextEditingController _typeController = TextEditingController();
DateTime time = DateTime.now();



class _ReserveState extends State<Reserve> {final _formKey = GlobalKey<FormState>();
void initState() {
  time = DateTime.now();

  super.initState();
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body:
    SingleChildScrollView(
      child: Column(
        children: [
          DropdownSearch<String>(
              mode: Mode.MENU,
              label: "Charging",
              showSelectedItem: true,
              items:["✅","❌"],
              onChanged: (val){
                selectedcharging = val;
              },
              selectedItem: selectedcharging),
          DropdownSearch<String>(
              mode: Mode.MENU,
              label: "AC",
              showSelectedItem: true,
              items:["✅","❌"],
              onChanged: (val){
                selectedac = val;
              },
              selectedItem: selectedac),
          DropdownSearch<String>(
              mode: Mode.MENU,
              label: "Wifi",
              showSelectedItem: true,
              items:["✅","❌"],
              onChanged: (val){
                selectedwifi = val;
              },
              selectedItem: selectedwifi),
          DropdownSearch<String>(
              mode: Mode.MENU,
              label: "TV",
              showSelectedItem: true,
              items:["✅","❌"],
              onChanged: (val){
                selectedtv = val;
              },
              selectedItem: selectedtv),



          TextField(
            controller: _available_inController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "Availability",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _driverController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Enter Destination" : null,
            decoration: InputDecoration(
                labelText: "Driver",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _driver_experienceController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter Number" : null,
            decoration: InputDecoration(
                labelText: "Driver Experience",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _seat_capacityController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter Number" : null,
            decoration: InputDecoration(
                labelText: "Seat Capacity",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _vehicle_current_locationController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter Number" : null,
            decoration: InputDecoration(
                labelText: "Current Location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _typeController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter Number" : null,
            decoration: InputDecoration(
                labelText: "Type",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _pricingController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Enter location" : null,
            decoration: InputDecoration(
                labelText: "Pricing",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _vehicle_numberController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Enter location" : null,
            decoration: InputDecoration(
                labelText: "Vehicle Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _imgController,
            keyboardType: TextInputType.text,

            decoration: InputDecoration(
                labelText: "ImageLink",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
         

          RaisedButton(
              color: Colors.blue.shade700,
              child: Text("Reserve Reserve"),
              onPressed: () {

                FirebaseFirestore.instance.collection("Reserve").doc('${time.millisecond}${time.second}').set({
                  'available_in': _available_inController.text,
                  'charging/ac/wifi/tv': "${selectedcharging}/${selectedac}/$selectedwifi/$selectedtv",
                  'driver': _driverController.text,
                  'driver_experience': _driver_experienceController.text,
                  'seat_capacity': _seat_capacityController.text,
                  'pricing': _pricingController.text,
                  'type': _typeController.text,
                  'vehicle_current_location':_vehicle_current_locationController.text,
                  'vehicle_id':'${time.millisecond}${time.second}',
                  'vehicle_number':_vehicle_numberController.text,
                  'img_url':_imgController.text

                });
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text("Reserve"),
                    content: Text(
                        " Success! Vehicle Reserveed"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);


                            _available_inController.clear();
                            _driver_experienceController.clear();
                            _driverController.clear();
                            _seat_capacityController.clear();
                            _typeController.clear();
                            _pricingController.clear();
                            _vehicle_current_locationController.clear();
                          },
                          child: Text("OK")),
                    ],
                  ),
                );
              }

          ),


        ],
      ),
    ),

  );
}
}
