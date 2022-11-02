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
        scaffoldBackgroundColor: Colors.white,
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
  String moneyDisplay = "0.00";
  List<Widget> _newEntry = [];

  double amount = 0;
  String amountDisplay = "0.00";
  String description = "";
  DateTime date = DateTime(2022, 10, 31);

  String formatDouble(double num){
    return num * 10 == (num * 10).toInt() ? num.toString() + "0" : num.toString();
  }

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
          height: 150,
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
              MaterialButton(
                child: Text('date'),
                onPressed: () async{
                  DateTime newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                  );
                  if (newDate == null) return;
                  setState(() => date = newDate);
                },
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
    money = double.parse(money.toStringAsFixed(2));
    moneyDisplay = formatDouble(money);
    amountDisplay = formatDouble(amount);

    setState(() {
      _newEntry.add(_newContainer());
    });
  }

  Widget _newContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10, right:5, left:5),
      decoration: BoxDecoration(
          color: amount < 0 ? Colors.deepOrangeAccent : Colors.lightGreen,
          borderRadius: BorderRadius.all(Radius.circular(20),
          )
      ),
      width: 100,
      child: ListTile(
        title: Text('$amountDisplay€'),
        subtitle: Text(description),
        leading: Icon(Icons.attach_money),
        trailing: Text('${date.day}.${date.month}.${date.year}'),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$moneyDisplay€',
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
