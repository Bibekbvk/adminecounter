import 'package:adminecounter/homepage.dart';
import 'package:adminecounter/main.dart';
import 'package:adminecounter/searchdistrict.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Booking extends StatefulWidget {

  @override

  _BookingState createState() => _BookingState();
}

TextEditingController _breakfastController = TextEditingController();
TextEditingController _destinationController = TextEditingController();
TextEditingController _driver_experienceController = TextEditingController();
TextEditingController _lunchController = TextEditingController();
TextEditingController _offerController = TextEditingController();
TextEditingController _pickup_locationController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _routeController = TextEditingController();
TextEditingController _seatController = TextEditingController();
TextEditingController _shiftController = TextEditingController();
TextEditingController _startlocationController = TextEditingController();
TextEditingController _sub_driverController = TextEditingController();
TextEditingController _timeController = TextEditingController();
TextEditingController _typeController = TextEditingController();
TextEditingController _vehicle_numberController = TextEditingController();
TextEditingController _departure_dateController = TextEditingController();
TextEditingController _vehicle_nameController = TextEditingController();
TextEditingController _imgurlController = TextEditingController();


String selectedcharger;
String selectedtv;
String selectedmusic;
String selectedac;
String selectedwifi;

DateTime time = DateTime.now();


class _BookingState extends State<Booking> {final _formKey = GlobalKey<FormState>();
@override
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
            TextFormField(
              controller: _vehicle_nameController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Vehicle Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            DropdownSearch<String>(
                mode: Mode.MENU,
                label: "Charger",
                showSelectedItem: true,
                items:["✅","❌"],
                onChanged: (val){
                  selectedcharger = val;
                },
                selectedItem: selectedcharger),
            DropdownSearch<String>(
                mode: Mode.MENU,
                label: "TV",
                showSelectedItem: true,
                items:["✅","❌"],
                onChanged: (val){
                  selectedtv = val;
                },
                selectedItem: selectedtv),
            DropdownSearch<String>(
                mode: Mode.MENU,
                label: "Music",
                showSelectedItem: true,
                items:["✅","❌"],
                onChanged: (val){
                  selectedmusic = val;
                },
                selectedItem: selectedmusic),
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
            TextField(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DistrictSearch(searched: _breakfastController,)),
                );

              },
              controller: _breakfastController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "BreakFast",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _destinationController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Enter Destination" : null,
              decoration: InputDecoration(
                  labelText: "Destination",
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
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DistrictSearch(searched: _lunchController,)),
                );

              },
              controller: _lunchController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Lunch",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _offerController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Offer",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _pickup_locationController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Enter location" : null,
              decoration: InputDecoration(
                  labelText: "Pickup Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Enter Price" : null,
              decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),

            ),
            TextFormField(
              controller: _routeController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Route",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _seatController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Seat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _shiftController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Shift",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _startlocationController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Start Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _sub_driverController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Sub Driver",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _timeController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Please enter Number" : null,
              decoration: InputDecoration(
                  labelText: "Time",
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
              controller: _vehicle_numberController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Enter Vehicle Number" : null,
              decoration: InputDecoration(
                  labelText: "Vehicle Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              controller: _imgurlController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Enter Vehicle Number" : null,
              decoration: InputDecoration(
                  labelText: "Image Url",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            TextFormField(
              onTap: (){

                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    onChanged: (date) {}, onConfirm: (date) {

                        String dates =  "${date.year}/${date.month}/${date.day}";
                        _departure_dateController.text=dates;
                      });
                    },
              controller: _departure_dateController,
              keyboardType: TextInputType.text,
              validator: (val) =>
              val.isEmpty ? "Enter Vehicle Number" : null,
              decoration: InputDecoration(
                  labelText: "Departure Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            RaisedButton(
              color: Colors.blue.shade700,
              child: Text("Register Ticket"),
              onPressed: () {

                  FirebaseFirestore.instance.collection("booking").doc('${time.millisecond}${time.second}').set({
                    'breakFast': _breakfastController.text,
                    'driver_experience': _driver_experienceController.text,
                    'launch': _lunchController.text,
                    'offer': _offerController.text,
                    'pickup_location': _pickup_locationController.text,
                    'price': _priceController.text,
                    'route': _routeController.text,
                    'seat': _seatController.text,
                    'sub_driver': _sub_driverController.text,
                    'vehicle_number': _vehicle_numberController.text,
                    'charger': selectedcharger,
                    'tv': "${selectedtv}/$selectedmusic/$selectedac",
                    'wifi': selectedwifi,
                    'destination': _destinationController.text,
                    'startlocation': _startlocationController.text,
                    'shift': _shiftController.text,
                    'type': _typeController.text,
                    'departure_date':_departure_dateController.text,
                  "vehicle_id":'${time.millisecond}${time.second}',
                  'vehicle_name':_vehicle_nameController.text,
                    'img_url':_imgurlController.text},

                  );
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


                                 _breakfastController.clear();
                              _destinationController.clear();
                              _driver_experienceController.clear();
                              _lunchController.clear();
                           _offerController.clear();
                              _pickup_locationController.clear();
                              _priceController.clear();
                               _routeController.clear();
                               _seatController.clear();
                              _shiftController.clear();
                              _startlocationController.clear();
                              _sub_driverController.clear();
                             _timeController.clear();
                           _typeController.clear();
                             _vehicle_numberController.clear();
                             _departure_dateController.clear();
                             _vehicle_nameController.clear();
                             _imgurlController.clear();},
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
