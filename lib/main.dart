import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'MethodChannel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Clique no botão de ação flutuante e obtenha documentos usando MethodChannel. Verificar documentos em'
                ' Logcat(pesquise "Documents")',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDocuments,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _getDocuments() async {
    MethodChannel _methodChannel = MethodChannel('flutter/MethodChannelDemo');
    List<dynamic> documentList = [""];
    try {
      documentList = await _methodChannel.invokeMethod("Documents");
    } on PlatformException {
      print("exceptiong");
    }
    documentList.forEach((document) {
      print("Documents: $document");
    });
  }
}
