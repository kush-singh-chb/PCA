import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class InvoiceTile extends StatefulWidget {
  final File _file;
  InvoiceTile(this._file);

  @override
  InvoiceTileState createState() => new InvoiceTileState();
}

class InvoiceTileState extends State<InvoiceTile> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Text(
        basename(widget._file.path),
        style: new TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
