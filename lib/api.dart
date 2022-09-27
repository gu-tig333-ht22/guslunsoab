import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ListOfthings.dart';

void fetchtodo(String text) async {
  var list;
  var response = await http.post(
    Uri.parse(
        'https://todoapp-api.apps.k8s.gu.se/todos?key=835792ca-8f99-4d63-b7b2-1f3594682b37'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'message': text.toString(),
      'done': false,
    }),
  );

  list = (json.decode(response.body) as List)
      .map((todo) => ListOfThings.fromJson(todo))
      .toList();
}

// under ska nog in i min Listofthings-fil, eller någon annanstans?
// factory todoItem.fromJson(Map<String, dynamic> json) {
//     return ListOfThings(
//       done: json['done'],
//       message: json['message'],
//       id: json["id"],
//     );
 

 
// //min key url - så jag hittar den snabbt. 
// var response =  await http.get('https://todoapp-api.apps.k8s.gu.se/todos?key=835792ca-8f99-4d63-b7b2-1f3594682b37');