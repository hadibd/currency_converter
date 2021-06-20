import 'package:currency_converter/const.dart';
import 'package:currency_converter/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedItem1 = "USD";
  String selectedItem2 = "USD";

  List<DropdownMenuItem<String>> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownMenuItem = [];

    for (String currency in currencyList) {
      var menuItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownMenuItem.add(menuItem);
    }
    return dropdownMenuItem;
  }

  List<Text> getCupertinoPicker() {
    List<Text> currencyText = [];

    for (String currency in currencyList) {
      var text = Text(currency);
      currencyText.add(text);
    }
    return currencyText;
  }

  @override
  Widget build(BuildContext context) {
    Network network = Network('currency1', 'currency2');
    network.getData();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'From: ',
                  style: TextStyle(fontSize: 20.0),
                ),
                DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        selectedItem1 = value!;
                        print(selectedItem1);
                      });
                    },
                    hint: Text('From'),
                    value: selectedItem1,
                    items: getDropdownButton()),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'To: ',
              style: TextStyle(fontSize: 20.0),
            ),
            CupertinoPicker(
                itemExtent: 50.0,
                backgroundColor: Colors.deepOrange,
                diameterRatio: 32.0,
                onSelectedItemChanged: (value) {
                  setState(() {
                    selectedItem2 = currencyList[value];
                  });
                  print(selectedItem2);
                },
                children: getCupertinoPicker())
          ]),
        ),
      ),
    );
  }
}
