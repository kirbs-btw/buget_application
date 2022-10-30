import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _money = 0;
  List<Widget> _newEntry = [];
  void _addEntry() {
    setState(() {
      _newEntry.add(_newContainer());

    });
  }
  Widget _newContainer() {
    return Dismissible(
      child: Container(
        child: ListTile(
          title: Text("hello"),
          subtitle: Text("hello"),
          leading: Icon(Icons.dashboard),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$_money€',
          style: TextStyle(
            fontFamily: 'Gothamhft',
            // insert font to files -------------------------------------
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _newEntry.length,
        itemBuilder: (context, index){
        return _newEntry[index];
        },
      ),

      floatingActionButton: FloatingActionButton(
        // change the function to an add widget button
        onPressed: _addEntry,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
