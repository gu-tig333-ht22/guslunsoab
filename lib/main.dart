import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SecondView.dart';
import 'ListOfthings.dart';

void main() {
  var state = Mystate();
  runApp(ChangeNotifierProvider(create: (context) => state, child: Myapp()));
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
            ]),
        body: todo_list_View(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var item = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondView()),
            );
            Provider.of<Mystate>(context, listen: false)
                .addItem(ListOfThings(item));
          },
          child: const Icon(
            Icons.add,
            size: 50,
          ),
          backgroundColor: Colors.grey,
        ));
  }
}

class Todolist extends StatelessWidget {
  final List<ListOfThings> list;

  Todolist(this.list);

  Widget build(BuildContext context) {
    return ListView(children: list.map((todo) => _todoItem(todo)).toList());
  }

  
  Widget _todoItem(todo) {
    return Consumer<Mystate>(
        builder: (context, state, child) => 
        ListTile(
        leading: Checkbox(
          value: todo.done,
          onChanged: (val) {
            Provider.of<Mystate>(context, listen: false)
                .checkItem(todo, val);
          },
        ),
        title: Text(todo.message),
        trailing: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
             var state = Provider.of<Mystate>(context, listen: false);
             state.removeTodo(todo);
          },
        ),
      ));
  }
}

class todo_list_View extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<Mystate>(
        builder: (context, state, child) => Todolist(state.list));
  }
}