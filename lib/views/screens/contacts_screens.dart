import 'package:dars_18/controllers/contacts.dart';
import 'package:dars_18/views/widgets/contact_add_dialog.dart';
import 'package:dars_18/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final contactsController = ContactsController();

  void delete(int index){
    contactsController.delete(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async{
            Map<String,dynamic> data = await showDialog(barrierDismissible: false,context: context, builder: (context){
              return ContactAddDialog();
            });
            if(data != null){
              contactsController.add(data['name'], data['phone']);
              setState(() {});
            }
          }, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(itemCount:contactsController.contactList.length,itemBuilder: (ctx, index){
        return ContactItem(contact: contactsController.contactList[index],onDelete: (){delete(index);},);
      }),
    );
  }
}
