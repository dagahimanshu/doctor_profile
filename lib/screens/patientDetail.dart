import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientDetailState();
  }
}

class PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(243, 121, 31, .5),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    height: MediaQuery.of(context).size.height * 0.33,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage("images/profile_background.jpg"),
                      fit: BoxFit.cover,
                    ))),
                Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  padding: EdgeInsets.all(40.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 121, 31, .3),
                  ),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Container(
                          width: 75.0,
                          height: 75.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      new AssetImage("images/profile.jpg")))),
                      SizedBox(height: 10.0),
                      Text(
                        "Angelina Farererrro",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            "BMS Hospital",
                            style: TextStyle(color: Colors.black87),
                          )),
                          Expanded(
                              child: Text(
                            "37 yrs",
                            style: TextStyle(color: Colors.black87),
                          ))
                        ],
                      )
                    ],
                  )),
                )
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('prescription_list')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Updating prescriptions...');
                  default:
                    return new ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
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
                                  title: Text(
                                    document['Name'],
                                  ),
                                  subtitle: Text(document['Date']),
                                  onTap: () {
                                    Navigator.pushNamed(context, '_sample');
                                  },
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                )));
                      }).toList(),
                    );
                }
              },
            )
            /*
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 4,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 121, 31, .1),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: ListTile(
                        title: Text('Hospital name'),
                        subtitle: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "Date",
                              style: TextStyle(color: Colors.grey),
                            )),
                            Expanded(
                                child: Text(
                              "Time",
                              style: TextStyle(color: Colors.grey),
                            ))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right)),
                  ),
                );
              },
            )*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '_prescription');
        },
        backgroundColor: Color.fromRGBO(243, 121, 31, .8),
        child: Icon(Icons.add),
      ),
    );
  }
}
