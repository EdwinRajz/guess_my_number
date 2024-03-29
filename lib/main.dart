import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  print(i);
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Random random = Random();
int i = random.nextInt(100);

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guess my number')),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                    'I\'\ m thinking a of a number between 0 and 99. Can you guess it?'),
                TextField(
                  controller: controller1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Your guess',
                    hintText: 'number',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                      ),
                      onPressed: () {
                        controller1.clear();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FlatButton(
          onPressed: () {
            int guess = int.tryParse(controller1.text);
            if (guess == i) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Congratulations you have guessed the number!'),
                  );
                },
              );
            }
            if (guess == null) {
              // todo: #1 specify the type for snackBar
              final noValueBar = SnackBar(
                content: Text('No Value entered, please provide a number'),
              );
              Scaffold.of(context).showSnackBar(noValueBar);
            } else if (guess > i) {
              // todo: #2 specify the type for snackBar
              final tooHighBar = SnackBar(content: Text('The value is too high'));
              Scaffold.of(context).showSnackBar(tooHighBar);
            } else if (guess < i) {
              // todo: #3 specify the type for snackBar
              final tooLowBar = SnackBar(
                content: Text('The value is too low'),
              );
              Scaffold.of(context).showSnackBar(tooLowBar);
            }
            controller1.clear();
          },
          child: Text('Check'),
        );
        // todo: #4 don't forget to format your code
      },),
    );
  }
}
