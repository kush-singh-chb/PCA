import 'package:flutter/material.dart';

import 'objects/InvoiceFormData.dart';

class NewInvoice extends StatefulWidget{
  @override
  NewInvoiceState createState() {
    return new NewInvoiceState();
  }
  
}

class NewInvoiceState extends State<NewInvoice> {
  InvoiceFormData _formData;
  @override
  Widget build(BuildContext context) {
   return new Center(
     child: new Form(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new TextFormField(
              
            ),
          )
        ],
      )
     )
   );
  }
}