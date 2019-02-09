import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SamplePrescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SamplePrescriptionState();
}

class SamplePrescriptionState extends State<SamplePrescription> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(243, 121, 31, 1),
        title: Text('Sample Prescription'),
      ),
      body: Container(
          color: Color.fromRGBO(243, 121, 31, .5),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('sample_prescription')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Updating medicine list...');
                default:
                  return new ListView(
                    scrollDirection: Axis.vertical,
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
                                leading: Icon(Icons.keyboard_arrow_right),
                                title: Text(
                                  document['name'],
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(document['quantity'])),
                                        Expanded(
                                            child: Text(document['timing']))
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("precautions: " +
                                          document['precautions']),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  //
                                },
                                trailing: Icon(Icons.keyboard_arrow_right),
                              )));
                    }).toList(),
                  );
              }
            },
          )),
    ));
  }
}
