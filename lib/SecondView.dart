import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  TextEditingController iteminput = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG333 ADD TASK TO LIST:'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            AddtasktolistView(),
            FloatingActionButton.small(
              onPressed: () {
                Navigator.pop(context, iteminput.text);
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.add, color: Colors.black),
            )
          ])),
    );
  }

  Widget AddtasktolistView() {
    return Container(
      margin: EdgeInsets.only(
        left: 50,
        right: 50,
        top: 30,
        bottom: 30,
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black, spreadRadius: 2),
      ]),
      child: TextField(
        controller: iteminput,
        decoration: InputDecoration(labelText: '  What are you going to do?'),
      ),
    );
  }
}
