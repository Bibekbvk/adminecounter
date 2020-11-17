
import 'package:adminecounter/booking_vehicle.dart';
import 'package:adminecounter/display_users.dart';
import 'package:adminecounter/movers_register.dart';
import 'package:adminecounter/reserve_register.dart';
import 'package:adminecounter/searchdistrict.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



//import 'package:cloud_firestore/cloud_firestore.dart';
class e_counter extends StatefulWidget {

  @override
  _e_counterState createState() => _e_counterState();
}

class _e_counterState extends State<e_counter> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "E-counter Nepal",
          )),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.all(1),
              child: ListView(
                children: [
                  Image.asset('assets/logo.png'),
                ],
              )),

          Card(
            elevation: 22,
            shadowColor: Colors.yellowAccent,
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
               /* Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aboutpage()));*/
              },
            ),
          ),

          Card(
            elevation: 22,
            shadowColor: Colors.yellowAccent,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.star),
              title: Text("Rate us"),
              onTap: () {
                launch(
                    'https://play.google.com/store/apps/details?id=com.f1soft.esewa&hl=en');
              },
            ),
          ),

          Card(
            elevation: 22,
            shadowColor: Colors.yellowAccent,
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: () {
               /* Share.share(
                    "Please Download our app, https://play.google.com/store/apps/details?id=com.f1soft.esewa&hl=en ");*/
                // Navigator.of(context).pop();

                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutpage()));
              },
            ),
          ),
        ]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Admin Panel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.115,
                    0,
                    MediaQuery.of(context).size.width * 0.115,
                    MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            MediaQuery.of(context).size.height * 0.02,
                            0,
                            MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.bus,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Register Booking Vehicle',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Booking()));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.car,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Reserve',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reserve()));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.lightBlue),
                                ),
                                child: InkWell(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.contact_phone_outlined,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Booking Users',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                    Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ShowUsers(service:"User Booking")));
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            MediaQuery.of(context).size.height * 0.02,
                            0,
                            MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.app_registration,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Reserving Users',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowUsers(service:"User Reserve")));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,),
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.money_off_outlined,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Movers Users',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowUsers(service:"User Movers")));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_city,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Search District',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DistrictSearch()));
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),


                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.celebration,
                                            color: Colors.blue[900], size: 44),
                                        Text(
                                          'Offer',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => offers()));*/
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            MediaQuery.of(context).size.height * 0.02,
                            0,
                            MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Movers()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.lightBlue),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.truckLoading,
                                          color: Colors.blue[900], size: 44),
                                      Text(
                                        'Mover',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                      Border.all(color: Colors.lightBlue),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.info,
                                            color: Colors.blue[900], size: 44),
                                        SizedBox(height: 20),
                                        Text(
                                          'About Us',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Aboutpage()));*/
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.lightBlue),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.feedback,
                                        color: Colors.blue[900], size: 44),
                                    Text(
                                      'Feedback',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    border: Border.all(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
