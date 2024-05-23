import 'package:dars_18/models/todo.dart';
import 'package:dars_18/views/screens/done.dart';
import 'package:dars_18/views/screens/no_done.dart';
import 'package:dars_18/views/widgets/todo_add.dart';
import 'package:flutter/material.dart';


class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Todos'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'No Done'),
              Tab(text: 'Done'),
            ],
          ),
          actions: [
            IconButton(onPressed: () async{
              String todo = await showDialog(context: context, builder: (ctx){
                return AddTodo();
              });

              if(todo == 'Yes'){
                setState(() {});
              }
            }, icon: Icon(Icons.add))
          ],
        ),
        body: TabBarView(
          children: [
            NoDone(),
            DonePage(),
          ],
        ),
      ),
    );
  }
}
