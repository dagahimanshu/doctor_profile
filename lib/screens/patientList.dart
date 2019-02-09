import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PatientListState();
  }
}

class PatientListState extends State<PatientList> {
  static var sortBy = ['location', 'time'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(DateFormat.MMMd().format(new DateTime.now())),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(243, 121, 31, 1),
        title: Text('Appointments'),
        actions: <Widget>[],
      ),
      body: Container(
          color: Color.fromRGBO(243, 121, 31, .5),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('patient_list').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Updating patients...');
                default:
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return Card(
                          color: Theme.of(context).primaryColorLight,
                          elevation: 2.0,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(242, 230, 220, 1),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: ListTile(
                                title:  Text(
                                  document['Name'],
                                ),
                                subtitle:  Text(document['Hospital']),
                                leading: Icon(Icons.face),
                                onTap: () {
                                  Navigator.pushNamed(context, '_detail');
                                },
                                trailing: Icon(Icons.keyboard_arrow_right),
                              )));
                    }).toList(),
                  );
              }
            },
          )


          ),
    );
  }
}
