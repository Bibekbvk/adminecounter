import 'package:adminecounter/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Rental extends StatefulWidget {
  @override
  _RentalState createState() => _RentalState();
}
TextEditingController _available_inController = TextEditingController();
TextEditingController _capacityController = TextEditingController();
TextEditingController _current_locationController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController rentedbyController = TextEditingController();
TextEditingController _pricingController = TextEditingController();
TextEditingController _vehicle_usedController = TextEditingController();
TextEditingController _vehicleNameController = TextEditingController();

String selectedinsurance;
DateTime time = DateTime.now();


class _RentalState extends State<Rental> {final _formKey = GlobalKey<FormState>();
void initState() {
  time = DateTime.now();

  super.initState();
}
@override
Widget build(BuildContext context) {
  List pricelist = ["Damak to Urlabari : 1000", "Dhanusa to Sankhuwasabha : 5000"];

  return Scaffold(
    appBar: AppBar(),
    body:
    SingleChildScrollView(
      child: Column(
        children: [
          DropdownSearch<String>(
              mode: Mode.MENU,
              label: "Insurance",
              showSelectedItem: true,
              items:["✅","❌"],
              onChanged: (val){
                selectedinsurance = val;
              },
              selectedItem: selectedinsurance),



          TextField(
            controller: _available_inController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: "Availibility",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _capacityController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Enter Destination" : null,
            decoration: InputDecoration(
                labelText: "Capacity",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: _current_locationController,
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
            controller: _descriptionController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter Number" : null,
            decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
          TextFormField(
            controller: rentedbyController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Please enter Number" : null,
            decoration: InputDecoration(
                labelText: "Rented By",
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
            controller: _vehicle_usedController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Enter Price" : null,
            decoration: InputDecoration(
                labelText: "Vehicle Used",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),

          ),
          TextFormField(
            controller: _vehicleNameController,
            keyboardType: TextInputType.text,
            validator: (val) =>
            val.isEmpty ? "Enter Price" : null,
            decoration: InputDecoration(
                labelText: "Vehicle Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )),

          ),

          RaisedButton(
              color: Colors.blue.shade700,
              child: Text("Register Rental"),
              onPressed: () {

                FirebaseFirestore.instance.collection("Rental").doc('${time.millisecond}${time.second}').set({
                  'available_in': _available_inController.text,
                  'capacity': _capacityController.text,
                  'current_location': _current_locationController.text,
                  'description': _descriptionController.text,
                  'rentedby': rentedbyController.text,
                  'pricing': _pricingController.text,
                  'vehicle_used': _vehicle_usedController.text,
                  'insurance': selectedinsurance,
                  "vehicle_id":'${time.millisecond}${time.second}',
                  'price_list':pricelist,
                  'vehiclename':_vehicleNameController.text,

                });
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text("Register"),
                    content: Text(
                        " Success! Vehicle Registered"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);


                            _available_inController.clear();
                            _capacityController.clear();
                            _current_locationController.clear();
                            _descriptionController.clear();
                            rentedbyController.clear();
                            _pricingController.clear();
                            _vehicle_usedController.clear();
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
