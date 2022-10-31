import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double money = 0;
  List<Widget> _newEntry = [];

  double amount = 19.00;
  String description = "fuck";

  // format double amount
  // add a 0 if missing to shot money
  // format function
  void updateDescription(String text){
    description = text;
  }

  void updateAmount(String text){
    amount = double.parse(text);
  }

  _addEntryCard(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("new entry"),
        content: SizedBox(
          height: 100,
          child: Column(

            children: <Widget>[
              TextField(
                onChanged: updateDescription,
                decoration: InputDecoration(
                  hintText: "description",
                ),
              ),
              TextField(
                onChanged: updateAmount,
                decoration: InputDecoration(
                  hintText: "00.00",
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text("add"),
            onPressed: (){
              addEntry(context);
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text("cancel"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  void addEntry(context) {
    Navigator.of(context).pop();
    money = money + amount;
    print(money);
    money = double.parse(money.toStringAsFixed(2));
    print(money);

    setState(() {
      _newEntry.add(_newContainer());
    });
  }

  Widget _newContainer() {
    return Container(
      width: 100,
      child: ListTile(
        title: Text('$amount€'),
        subtitle: Text(description),
        leading: Icon(Icons.attach_money),
      ),
      color: amount < 0 ? Colors.deepOrangeAccent : Colors.lightGreen,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$money€',
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
        onPressed: (){
          _addEntryCard(context);
        },
        tooltip: 'Increment',
        child: Icon( Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
