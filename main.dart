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
        backgroundColor: Colors.white,
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

  LinearGradient calcGradient(){
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        amount < 0 ? Color(0xfff8385e) : Color(0xff8bf838),
        Colors.transparent,
      ],
    );
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
      width: 50,
      decoration: BoxDecoration(
        gradient: calcGradient(),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 5, right:10, left:10, bottom: 5),
        decoration: BoxDecoration(
            color: Color(0x99303143),
            borderRadius: BorderRadius.all(Radius.circular(20),
            )
        ),
        width: 100, 
        child: ListTile(
          title: Text(
              '$amountDisplay€',
              style: TextStyle(
                color: Colors.white,
            )
          ),
          subtitle: Text(
              description,
              style: TextStyle(
                color: Colors.white,
              )
          ),
          trailing: Text(
              '${date.day}.${date.month}.${date.year}',
              style: TextStyle(
                color: Colors.white,
              ),
          ),
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
          '$moneyDisplay€',
          style: TextStyle(
            fontFamily: 'Gothamhft',
            // insert font to files -------------------------------------
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff242335),
                Color(0xff3b3e51),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xff242335),
              Color(0xff3b3e51),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: _newEntry.length,
          itemBuilder: (context, index){
            return _newEntry[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'party',
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(229, 141, 144, 1), Color.fromRGBO(248, 56, 94, 1)],
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            width: 10000,
            height: 10000,
            alignment: Alignment.center,
            child: const Icon(Icons.add),
          ),
        ),
        onPressed: () {
          _addEntryCard(context);
        },
      ),
    );
  }
}
