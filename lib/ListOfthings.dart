import 'package:flutter/material.dart';

class ListOfThings {
  String message;
  bool done = false;

  ListOfThings(this.message);
}

class Mystate extends ChangeNotifier {
  List <ListOfThings> _list=[];

  Mystate();

  List<ListOfThings> get list => _list;

  void addItem(ListOfThings todo) {
    _list.add(todo);
    notifyListeners();
  }

  void checkItem(todo, val) {
    todo.done = val;
    notifyListeners();

  }

   void removeTodo(ListOfThings todo) {
    _list.remove(todo);
    notifyListeners();

   }
}