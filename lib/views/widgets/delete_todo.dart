import 'package:flutter/material.dart';

class TodoDelete extends StatefulWidget {
  const TodoDelete({super.key});

  @override
  State<TodoDelete> createState() => _TodoDeleteState();
}

class _TodoDeleteState extends State<TodoDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Siz rostdan ham mana shu rejani ochirmoqchimisiz',textAlign: TextAlign.center,),
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
