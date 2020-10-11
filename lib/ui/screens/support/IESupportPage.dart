import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';

class IESupportPage extends StatefulWidget {
  static const String routeName = '/support';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IESupportPageState();
  }
}

class _IESupportPageState extends State<IESupportPage> {
  final _formKey = GlobalKey<FormState>();

  String _maritalStatus = 'single';
  String _tite = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Support",style: TextStyle(color: Colors.white),),
        ),
        drawer: IESideMenu(),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10,0),
              child: ListView(
                children: getFormWidget(),),
            )));
  }


  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    var _radioValue1;
    formWidget.add(
      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),child:   Text("Create New Ticket",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),)

    );
    formWidget.add(
      new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Radio(
            value: 0,
            groupValue: _radioValue1,

          ),
          new Text(
            'Problem',
            style: new TextStyle(fontSize: 16.0),
          ),
          new Radio(
            value: 1,
            groupValue: _radioValue1,

          ),
          new Text(
            'Help',
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );


    formWidget.add(new TextFormField(
      decoration: InputDecoration(labelText: 'Title', hintText: 'title'),
      keyboardType: TextInputType.name,
      maxLength: 20,

      onSaved: (value) {
        setState(() {
          _tite = value;
        });
      },
    ));

    formWidget.add(new TextFormField(
      decoration: InputDecoration(labelText: 'Description', hintText: 'Description'),
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      maxLength: 200,

      onSaved: (value) {
        setState(() {
          _description = value;
        });
      },
    ));

    formWidget.add(new RaisedButton(
        color: Colors.green,
        textColor: Colors.white,
        child: new Text('Submit'),
        onPressed: (){}));
    return formWidget;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}