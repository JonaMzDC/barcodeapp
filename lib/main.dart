import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar code app ',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter barcode app '),
    );
  }
}

class MyHomePage extends StatefulWidget {




  final String title;
  final String barCode;

  MyHomePage({Key key, this.title, this.barCode}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  String _code;
  String _barcode="";




  Future _getBarcode() async{

    _code = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true, ScanMode.BARCODE);

    setState(() {

      _barcode = _code;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Valor del Scan:',
            ),
            Text(
              '$_barcode',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getBarcode,
        tooltip: 'Barcode',
        child: Icon(Icons.camera_alt),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
