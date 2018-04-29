import 'dart:async';

import 'package:flutter/material.dart';

import 'InvoiceTile.dart';
import 'NewInvoice.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();

  Future<List<FileSystemEntity>> _dirContents() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var files = <FileSystemEntity>[];
    var completer = new Completer();
    var lister = directory.list(recursive: false);
    lister.listen((file) => files.add(file),
        // should also register onError
        onDone: () => completer.complete(files));
    return files;
  }

  List<InvoiceTile> _buildInvoiceList() {
    var tileList = new List<InvoiceTile>();
    _dirContents().then((list) {
      list.forEach((file) => {tileList.add(new InvoiceTile(file)): tileList});
    });
    return tileList;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              child: viewProvider(),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new NewInvoice()));
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  viewProvider() {
    if (widget._buildInvoiceList().isNotEmpty) {
      return new ListView(
        children: widget._buildInvoiceList(),
      );
    } else {
      return new Text(
        'No Invoice Found',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      );
    }
  }
}
