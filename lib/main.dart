import 'package:doctor_profile/screens/patientList.dart';
import 'package:doctor_profile/screens/prescription.dart';
import 'package:doctor_profile/screens/sample_prescription.dart';
import 'package:flutter/material.dart';
import 'package:doctor_profile/screens/patientDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Appointments",
      theme:  ThemeData(primarySwatch:  Colors.deepOrange,),
      home: PatientList(),
      routes: <String,WidgetBuilder> {
        '_detail':  (BuildContext context) => PatientDetail(),
        '_prescription' : (BuildContext context) => Prescription(),
        '_sample' :(BuildContext context) => SamplePrescription(),
      },
    );
  }
}


