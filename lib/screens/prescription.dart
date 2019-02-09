import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PrescriptionState();
}

class PrescriptionState extends State<Prescription> {
  int _item1Count = 2, _item2Count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.1,
            backgroundColor: Color.fromRGBO(243, 121, 31,1),
            title: Text('Prescription'),
            actions: <Widget>[],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor:  Color.fromRGBO(243, 121, 31,.9),
            child: Icon(Icons.note_add),
          ),
          body: ListView(
            children: <Widget>[

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _item1Count,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 121, 31,.1),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListTile(
                          leading: Icon(Icons.local_hospital),
                          title: Text('Medicine name'),
                          subtitle: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                "Timing",
                                style: TextStyle(color: Colors.white),
                              )),
                              Expanded(
                                  child: Text(
                                "Quantity",
                                style: TextStyle(color: Colors.white),
                              ))
                            ],
                          ),
                          trailing: Icon(Icons.delete_outline)),
                    ),
                  );
                },
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _item2Count,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 121, 31,.1),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListTile(
                          leading: Icon(Icons.add_box),
                          title: Text('Diagnostic name'),
                          subtitle: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                "Reports By:",
                                style: TextStyle(color: Colors.white),
                              )),
                              Expanded(
                                  child: Text(
                                "Referred to:",
                                style: TextStyle(color: Colors.white),
                              ))
                            ],
                          ),
                          trailing: Icon(Icons.delete_outline)),
                    ),
                  );
                },
              ),
              Container(
                  margin:
                  new EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      child: Text("Add Medicine"),
                      color: Color.fromRGBO(243, 121, 31,.1),
                      onPressed: () {
                        setState(() {
                          showAlertDialog(context, 0);
                          _item1Count++;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: OutlineButton(
                      child: Text("Add Diagnosis"),
                      color: Color.fromRGBO(243, 121, 31,.1),
                      onPressed: () {
                        setState(() {
                          showAlertDialog(context, 4);
                          _item2Count++;
                        });
                      },
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
        onWillPop: () {
          Navigator.pop(context);
        });
  }

  showAlertDialog(BuildContext context, int i) {
    // set up the AlertDialog
    var list = [
      'Medicine name',
      'Timing',
      'Quantity',
      'Alternatives',
      'Diagnostic name',
      'done by',
      'referred to',
      'precautions(if any)'
    ];

    AlertDialog alert = AlertDialog(
        title: Text("Add details"),
        content: Container(
          height: 250.0,
          child: Column(
            children: <Widget>[
              TextField(decoration: InputDecoration(hintText: list[i])),
              TextField(
                decoration: InputDecoration(hintText: list[i + 1]),
              ),
              TextField(
                decoration: InputDecoration(hintText: list[i + 2]),
              ),
              TextField(
                decoration: InputDecoration(hintText: list[i + 3]),
              ),
              FlatButton(
                child: Text("Add"),
                onPressed: () {},
              )
            ],
          ),
        ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
