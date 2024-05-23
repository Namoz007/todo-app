import 'package:flutter/material.dart';

class ContactRename extends StatefulWidget {

  @override
  State<ContactRename> createState() => _ContactRenameState();
}

class _ContactRenameState extends State<ContactRename> {
  TextEditingController text = TextEditingController();
  String? nameEror = null;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Kontakt nomini ozgartirish"),
      content: TextField(
        controller: text,
        decoration: InputDecoration(
          errorText: nameEror,
          border: OutlineInputBorder(),
          hintText: 'Kontakt nomini ozgartirish',
        ),
      ),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('Bekor qilish')),

        ElevatedButton(onPressed: (){
          if(text.text.trim().length > 0){
            Navigator.of(context).pop(text.text);
          }else{
            nameEror = 'Iltimos ismni togri kiriting';
            setState(() {});
          }
        }, child: Text('Saqlash')),
      ],
    );
  }
}
