import 'dart:async';

import 'package:flutter/material.dart';

import 'InvoiceTile.dart';
import 'NewInvoice.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  var _files = <FileSystemEntity>[];
  @override
  _MyHomePageState createState() => new _MyHomePageState();

  Future<List<FileSystemEntity>> _dirContents() async {
    _files.clear();
    Directory directory = await getApplicationDocumentsDirectory();
    var completer = new Completer();
    var lister = directory.list(recursive: false);
    lister.listen((file) => _files.add(file),
        onError: (e) => print(e),
        onDone: () => completer.complete(_files));
        print("Total Files ${_files.length}");
    return _files;
  }

  List<InvoiceTile> _buildInvoiceList() {
    var tileList = new List<InvoiceTile>();
    _dirContents().then((list) {
      list.forEach((file) => {
        tileList.add(new InvoiceTile(file)): tileList});
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new RefreshIndicator(
                child: viewProvider(),
                onRefresh: (() {
                  print('Refreshed');
                  setState(() {});
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new NewInvoice(widget._files.length)));
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  viewProvider() {
    if (widget._buildInvoiceList().isNotEmpty) {
      return new ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: widget._buildInvoiceList(),
      );
    } else {
      return new Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: new Text(
          'No Invoice Found',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 22.0),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
