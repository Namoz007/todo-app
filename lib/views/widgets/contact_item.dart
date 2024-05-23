import 'package:dars_18/models/contact.dart';
import 'package:dars_18/views/widgets/contact_rename.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function() onDelete;
  ContactItem({required this.contact,required this.onDelete,super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: contact.color,),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () async {
            String newName = await showDialog(context: context, builder: (ctx){
              return ContactRename();
            });
          }, icon: Icon(Icons.edit,color: Colors.blue,)),
          IconButton(onPressed: onDelete, icon: Icon(Icons.delete,color: Colors.red,)),
        ],
      ),
    );
  }
}