import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class ListOfThings {
  var message = '';
  bool done = false;
  var id;

  ListOfThings({required this.message, required this.done, required this.id});

  factory ListOfThings.fromJson(Map<String, dynamic> json) {
    return ListOfThings(
      done: json['done'],
      message: json['title'],
      id: json["id"],
    );
  }
}

class Mystate extends ChangeNotifier {
  List<ListOfThings> _list = [];
  List<ListOfThings> get list => _list;
  var filterby = 'All';

  void addItem(text) async {
    var response = await http.post(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos?key=835792ca-8f99-4d63-b7b2-1f3594682b37'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': text.toString(),
        'done': false,
      }),
    );

    _list = (json.decode(response.body) as List)
        .map((text) => ListOfThings.fromJson(text))
        .toList();

    notifyListeners();
  }

  void checkItem(ListOfThings todo, val) async {
    todo.done = val; 
    var response = await http.put(
      Uri.parse(
          'https://todoapp-api.apps.k8s.gu.se/todos/${todo.id}?key=835792ca-8f99-4d63-b7b2-1f3594682b37'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': todo.message,
        'done': val,
      }),
    );
    notifyListeners();
  }

  void removeTodo(ListOfThings todo) async {
    _list.remove(todo);
    var response = await http.delete(
        Uri.parse(
            'https://todoapp-api.apps.k8s.gu.se/todos/${todo.id}?key=835792ca-8f99-4d63-b7b2-1f3594682b37'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });


    notifyListeners();
  }

  void changefilter(value) {
    filterby = value;
    notifyListeners();
  }

  // void createlist() async {
  //   var response = 
  //   await http.get(Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos/$?key=835792ca-8f99-4d63-b7b2-1f3594682b37')
  //   headers: <String, String> {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'title': text.toString(),
  //       'done': false,
  //     }),
  //   );

  //   _list = (json.decode(response.body) as List)
  //       .map((text) => ListOfThings.fromJson(text))
  //       .toList();

  //   notifyListeners();


  // }
}
