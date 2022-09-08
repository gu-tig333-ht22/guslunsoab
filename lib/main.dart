import 'dart:js';

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 15,),
            _duties(),
            _duties(),
            _duties(),
            //_buttom(),
            FloatingActionButton(
                child: const Icon(Icons.add),
                backgroundColor: Colors.grey,
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondView(),));
              }
      )]),    
    )
    );
  }

  }

  Widget _duties() {
    return Stack(
     children: [
      Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 30,),
      Checkbox(value: false, 
      onChanged: (val) {},
      ),
        const Positioned(
          left: 30,
          top: 9,
          child:Text('fndshbnfgjk')),
        const Positioned(
          left: 450,
          top: 3,
          child: Icon(Icons.clear))

      ]
      );
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
        body: Center(child: 
        Column(
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
      margin: EdgeInsets.only(left: 50, right: 50, top: 30,),
      child: TextField(decoration: InputDecoration(hintText: 'What are you going to do?'),),
      );
  }

  Widget _addicon() {
    return Container(
      margin: EdgeInsets.only(top: 20,),
      child: Icon( Icons.add),);
  }