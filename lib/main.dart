import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TIG333 TO DO LIST:'),
          backgroundColor: Colors.grey,
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
          child: Column(children: [
            Container(
              height: 15,
            ),
            _duties(),
            Container(
              height: 5,
            ),
            //_buttom(),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 30,bottom: 30),
                child: FloatingActionButton(
                  child: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                  backgroundColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondView(),
                        ));
                  }),
            )))
          ]),
        ));
  }
}

Widget _duties() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Checkbox(
      value: false,
      onChanged: (val) {},
    ),
    Text(
      'köp mjölk',
    ),
    FloatingActionButton.small(
      child: Icon(
        Icons.clear,
        size: 30,
      ),
      backgroundColor: Colors.grey,
      onPressed: () {},
    )
  ]);
}
//Widget _buttom() {
//  return Container(
//  child: ElevatedButton(
//  child: const Text('+'),
//onPressed: () {
//Navigator.push(context,
//MaterialPageRoute(builder: (context) => SecondView(),));
// }
// ));
// }

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG333 TO DO LIST:'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _add_task_list(),
          _addicon(),
        ],
      )),
    );
  }
}

Widget _add_task_list() {
  return Container(
    margin: EdgeInsets.only(
      left: 50,
      right: 50,
      top: 30,
    ),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.black, spreadRadius: 2),
    ]),
    child: TextField(
      decoration: InputDecoration(hintText: '  What are you going to do?'),
    ),
  );
}

Widget _addicon() {
  return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ));
}
