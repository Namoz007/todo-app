import 'package:dars_18/controllers/todo_controller.dart';
import 'package:dars_18/models/todo.dart';
import 'package:dars_18/views/widgets/delete_todo.dart';
import 'package:dars_18/views/widgets/todo_done.dart';
import 'package:flutter/material.dart';

class NoDone extends StatefulWidget {


  @override
  State<NoDone> createState() => _NoDoneState();
}

class _NoDoneState extends State<NoDone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            todos != null && todos.length > 0 ? Column(
              children: [
                for(int i = 0;i < todos.length;i++)
                  todos[i].isDone ? SizedBox() : Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.red)
                      ),
                      child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(padding: EdgeInsets.symmetric(horizontal:5,),
                              child: Text(todos[i].todoName,),),

                            Text('${todos[i].dateTime.day}/${todos[i].dateTime.month}/${todos[i].dateTime.year}'),

                            Row(
                              children: [
                                IconButton(onPressed: () async{
                                  String data = await showDialog(context: context, builder: (ctx){
                                    return TodoDone();
                                  });
                                  if(data == 'Yes'){
                                    todos[i].isDone = true;
                                    setState(() {});
                                  }
                                }, icon: Icon(Icons.check,color: Colors.green,)),

                                IconButton(onPressed: () async{
                                  String data = await showDialog(context: context, builder: (ctx){
                                    return TodoDelete();
                                  });
                                  if(data == 'Yes'){
                                    todos.remove(todos[i]);
                                    setState(() {});
                                  }
                                }, icon: Icon(Icons.delete,color: Colors.red,))
                              ],
                            )
                          ],
                        ),),
                    ),
                  ),
              ],
            ): Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(child: Text('Hozircha hech qanaqa rejalar yoq',style: TextStyle(fontSize: 25),)),
            )
          ],
        ),
      )
    );
  }
}
