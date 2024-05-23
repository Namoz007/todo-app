import 'package:flutter/material.dart';

class TodoNoDone extends StatefulWidget {
  const TodoNoDone({super.key});

  @override
  State<TodoNoDone> createState() => _TodoNoDoneState();
}

class _TodoNoDoneState extends State<TodoNoDone> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Siz bu rejani bajarib bolmadingizmi?')
        ],
      ),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Yoq')),

        ElevatedButton(onPressed: (){
          Navigator.of(context).pop('Yes');
        }, child: Text('Ha')),
      ],
    );
  }
}
