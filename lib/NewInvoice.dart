import 'package:flutter/material.dart';

import 'objects/InvoiceFormData.dart';

class NewInvoice extends StatefulWidget{
  int _invoiceNumber;
  NewInvoice(this._invoiceNumber);
  @override
  NewInvoiceState createState() {
    return new NewInvoiceState();
  }
  
}

class NewInvoiceState extends State<NewInvoice> {
  var _formData = new InvoiceFormData();
  @override
  Widget build(BuildContext context) {
   return new Material(
        color: Colors.blueAccent,
        child: new Center(
       child: new Form(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Invoice Id",
                  labelStyle: new TextStyle (color: Colors.black), 
                  fillColor: Colors.white,
                  border: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  contentPadding: new EdgeInsets.all(2.0)
                ),
                initialValue: '${widget._invoiceNumber}/18-19',
                onSaved: ((value){
                  _formData.invoiceNumber = value;
                }),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Invoice Date",
                  labelStyle: new TextStyle (color: Colors.black),     
                  fillColor: Colors.white,
                  border: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  contentPadding: new EdgeInsets.all(2.0)         
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Same As Above", style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold)),
                new Checkbox(
                tristate: false,
                value: _formData.sameAsAbove,
                onChanged: (value) => {
                  setState((){
                    _formData.sameAsAbove = value;
                  }): bool
                },
              ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Supply Date",
                  labelStyle: new TextStyle (color: Colors.black),
                  fillColor: Colors.white,
                  border: new UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  contentPadding: new EdgeInsets.all(2.0)              
                ),
              ),
            ),
          ],
        )
       )
     ),
   );
  }
}