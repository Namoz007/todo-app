import 'package:flutter/material.dart';

class TodoDone extends StatefulWidget {
  const TodoDone({super.key});

  @override
  State<TodoDone> createState() => _TodoDoneState();
}

class _TodoDoneState extends State<TodoDone> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Siz bu rejani bajarib boldingizmi?')
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
