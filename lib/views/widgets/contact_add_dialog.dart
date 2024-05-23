import 'package:flutter/material.dart';

class ContactAddDialog extends StatefulWidget {
  const ContactAddDialog({super.key});

  @override
  State<ContactAddDialog> createState() => _ContactAddDialogState();
}

class _ContactAddDialogState extends State<ContactAddDialog> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String phone = '';
  void _add(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      Navigator.pop(context,{'name':name,'phone':phone});

    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Kontakt qoshish'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ism',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Iltimos telefon raqam kiriting';
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  phone = newValue;
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Telefon raqam',
                  prefixIcon: Icon(Icons.add)
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Iltimos telefon raqam kiriting';
                } else if ((!RegExp(r"^\d+$").hasMatch(value))) {
                  return 'Itimos togri telefon raqam kiriting';
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  phone = newValue;
                }
              },
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('Bekor qilish')),

        TextButton(onPressed: () {
          _add();
        }, child: Text("Yaratish"))
      ],
    );
  }
}
