import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SecondView.dart';
import 'ListOfthings.dart';

void main() {
  var state = Mystate();
  state.createlist();
  runApp(ChangeNotifierProvider(create: (context) => state, child: Myapp()));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainView extends StatelessWidget {
  @override
   build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TIG333 TO DO LIST:'),
          backgroundColor: Colors.grey,
          actions: [
            PopupMenuButton(
                onSelected: (value) => {
                      Provider.of<Mystate>(context, listen: false)
                          .changefilter(value.toString())
                    },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text('All'),value: 'All'),
                      PopupMenuItem(child: Text('Done'), value: 'Done'),
                      PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                    ])
          ],
        ),
        body: todo_list_View(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var item = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondView()),
            );
            if (item != null) {
              Provider.of<Mystate>(context, listen: false)
              .addItem(item);
            }
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
        builder: (context, state, child) => ListTile(
              leading: Checkbox(
                value: todo.done,
                onChanged: (val) {
                  Provider.of<Mystate>(context, listen: false)
                      .checkItem(todo, val);
                },
              ),
              title: text(todo),
              trailing: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  var state = Provider.of<Mystate>(context, listen: false);
                  state.removeTodo(todo);
                },
              ),
            ));
  }

  Widget text(todo) {
    if (todo.done == true) {
      return Text(todo.message,
          style: TextStyle(decoration: TextDecoration.lineThrough));
    } else {
      return Text(todo.message,
          style: TextStyle(decoration: TextDecoration.none));
    }
  }
}

class todo_list_View extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<Mystate>(
        builder: (context, state, child) =>
            Todolist(_filterList(state.list, state.filterby)));
  }

  List<ListOfThings> _filterList(list, filterby) {
    if (filterby == 'All') return list;
    if (filterby == 'Done')
      return list.where((todo) => todo.done == true).toList();
    if (filterby == 'Undone')
      return list.where((todo) => todo.done == false).toList();
    else
      return list;
  }
}
