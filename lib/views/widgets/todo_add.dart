import 'package:dars_18/controllers/todo_controller.dart';
import 'package:dars_18/models/todo.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final formKey = GlobalKey<FormState>();
  TextEditingController todoName = TextEditingController();
  DateTime? time = null;
  String? error = null;

  void calendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        time = value;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add todo"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Iltimos reja nomini togir kiriting';
                    }
                  },
                  controller: todoName,
                  decoration: InputDecoration(
                    hintText: 'Enter todo name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16), // Bo'sh joy qo'shish uchun
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    time == null
                        ? Text('Kun tanlanmagan')
                        : Text('${time!.day}-${time!.month}-${time!.year}'),
                    IconButton(
                      onPressed: () {
                        calendar(context);
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
                Center(
                  child: error != null ? Text('$error',style: TextStyle(color: Colors.red),) : SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if(formKey.currentState!.validate()){
              if(todoName.text != null && todoName.text.trim().length > 0){
                if(time != null){
                  todos.add(Todo(todoName: todoName.text, dateTime: time!));
                  Navigator.of(context).pop('Yes');
                }else{
                  error = 'Iltimos reja vaqitini kiriting';
                  setState(() {});
                }
              }
            }
            setState(() {});
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
